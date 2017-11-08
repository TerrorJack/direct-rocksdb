module Database.RocksDB.DB
  ( openDB
  ) where

import Database.RocksDB.Exceptions
import Database.RocksDB.Internals
import Database.RocksDB.Marshal
import Database.RocksDB.Options
import Foreign
import Foreign.C
import GHC.ForeignPtr

openDB :: Options -> FilePath -> IO (ForeignPtr Rocksdb)
openDB opts path = do
  opts_fptr <- marshal opts
  withForeignPtr opts_fptr $ \opts_ptr ->
    withCString path $ \path_ptr -> do
      db_ptr <- withErrorMessagePtr $ c_rocksdb_open opts_ptr path_ptr
      newConcForeignPtr db_ptr $ c_rocksdb_close db_ptr
