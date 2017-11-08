{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wall -Wno-deprecations #-}

import Data.Foldable
import Distribution.Simple
import Distribution.Simple.LocalBuildInfo
import Distribution.Simple.Toolkit
import Distribution.System
import Distribution.Types.BuildInfo
import Distribution.Types.GenericPackageDescription
import Distribution.Types.PackageDescription
import System.Directory
import System.Environment
import System.FilePath

main :: IO ()
main =
  defaultMainWithHooks
    simpleUserHooks
    { hookedPrograms = [cmakeProgram]
    , confHook =
        \t f -> do
          lbi <- confHook simpleUserHooks t f
          let extra_libs =
                "stdc++" :
                (case buildOS of
                   Windows -> ["rpcrt4"]
                   _ -> [])
              [system_rocksdb] =
                [v | (k, v) <- flagAssignment lbi, k == "system-rocksdb"]
          if system_rocksdb
            then pure
                   lbi
                   { localPkgDescr =
                       updatePackageDescription
                         ( Just
                             emptyBuildInfo {extraLibs = "rocksdb" : extra_libs}
                         , []) $
                       localPkgDescr lbi
                   }
            else do
              rocksdb_srcdir <- (</> "rocksdb-5.8") <$> getCurrentDirectory
              let clbi = getComponentLocalBuildInfo lbi CLibName
                  rocksdb_libname =
                    getHSLibraryName (componentUnitId clbi) ++ "-rocksdb-5.8"
                  rocksdb_builddir =
                    componentBuildDir lbi clbi </> "rocksdb-5.8"
                  lib_installdir =
                    libdir $
                    getComponentInstallDirs
                      (packageDescription $ fst t)
                      lbi
                      CLibName
              for_ [rocksdb_builddir, lib_installdir] $
                createDirectoryIfMissing True
              withCurrentDirectory rocksdb_builddir $
                case buildOS of
                  Windows -> do
                    runLBIProgram
                      lbi
                      cmakeProgram
                      [rocksdb_srcdir, "-G", "Visual Studio 15 2017 Win64"]
                    runLBIProgram
                      lbi
                      cmakeProgram
                      [ "--build"
                      , "."
                      , "--target"
                      , "rocksdb"
                      , "--config"
                      , "Release"
                      ]
                    copyFile "rocksdb.lib" $
                      lib_installdir </> rocksdb_libname <.> "lib"
                  _ -> do
                    runLBIProgram
                      lbi
                      cmakeProgram
                      [ rocksdb_srcdir
                      , "-DCMAKE_BUILD_TYPE=Release"
                      , "-DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=true"
                      , "-G"
                      , "Ninja"
                      ]
                    ninja_extra_args <-
                      do r <- lookupEnv "NINJA_FLAGS"
                         pure $
                           case r of
                             Just s -> ["--", s]
                             _ -> []
                    runLBIProgram lbi cmakeProgram $
                      ["--build", ".", "--target", "librocksdb.a"] ++
                      ninja_extra_args
                    copyFile "librocksdb.a" $
                      lib_installdir </> "lib" ++ rocksdb_libname <.> "a"
              pure
                lbi
                { localPkgDescr =
                    updatePackageDescription
                      ( Just
                          emptyBuildInfo
                          { extraLibs = rocksdb_libname : extra_libs
                          , extraLibDirs = [lib_installdir]
                          }
                      , []) $
                    localPkgDescr lbi
                }
    }
