{-# LANGUAGE OverloadedStrings #-}

import Control.Exception.Safe
import Database.RocksDB.DB
import Database.RocksDB.Options
import Database.RocksDB.ReadOptions
import Database.RocksDB.WriteOptions
import Foreign
import System.Directory
import System.FilePath

main :: IO ()
main = do
  tmp_dir <- getTemporaryDirectory
  let opts = defaultOptions {createIfMissing = Just True}
      db_path = tmp_dir </> "direct-rocksdb-test.rocksdb"
  bracket (openDB opts db_path) finalizeForeignPtr $ \db_fptr ->
    bracket (marshalWriteOptions defaultWriteOptions) finalizeForeignPtr $ \wopts_fptr -> do
      putDB db_fptr wopts_fptr "key" "value"
      bracket (marshalReadOptions defaultReadOptions) finalizeForeignPtr $ \ropts_fptr -> do
        v <- getDB db_fptr ropts_fptr "key"
        print v
        assert (v == "value") $ pure ()
