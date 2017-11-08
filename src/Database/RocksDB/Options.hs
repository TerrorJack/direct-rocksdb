{-# LANGUAGE RecordWildCards #-}

module Database.RocksDB.Options
  ( Options(..)
  , defaultOptions
  , marshalOptions
  ) where

import Data.Foldable
import Database.RocksDB.Internals
import Foreign
import GHC.ForeignPtr

data Options = Options
  { totalThreads :: !(Maybe Int)
  , createIfMissing :: !(Maybe Bool)
  }

defaultOptions :: Options
defaultOptions = Options {totalThreads = Nothing, createIfMissing = Nothing}

marshalOptions :: Options -> IO (ForeignPtr RocksdbOptions)
marshalOptions Options {..} = do
  opts_p <- c_rocksdb_options_create
  for_ totalThreads $ \total_threads ->
    c_rocksdb_options_increase_parallelism opts_p $ fromIntegral total_threads
  for_ createIfMissing $ \flag ->
    c_rocksdb_options_set_create_if_missing opts_p $
    if flag
      then 1
      else 0
  newConcForeignPtr opts_p $ c_rocksdb_options_destroy opts_p
