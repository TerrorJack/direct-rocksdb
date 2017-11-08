{-# LANGUAGE RecordWildCards #-}

module Database.RocksDB.WriteOptions
  ( WriteOptions(..)
  , defaultWriteOptions
  , marshalWriteOptions
  ) where

import Database.RocksDB.Internals
import Database.RocksDB.Utils
import Foreign
import GHC.ForeignPtr

data WriteOptions = WriteOptions
  { sync :: !(Maybe Bool)
  , disableWAL :: !(Maybe Int)
  }

defaultWriteOptions :: WriteOptions
{-# INLINEABLE defaultWriteOptions #-}
defaultWriteOptions = WriteOptions {sync = Nothing, disableWAL = Nothing}

marshalWriteOptions :: WriteOptions -> IO (ForeignPtr RocksdbWriteoptions)
{-# INLINEABLE marshalWriteOptions #-}
marshalWriteOptions WriteOptions {..} = do
  wopts_p <- c_rocksdb_writeoptions_create
  setBoolOptions sync $ c_rocksdb_writeoptions_set_sync wopts_p
  setIntOptions disableWAL $ c_rocksdb_writeoptions_disable_WAL wopts_p
  newConcForeignPtr wopts_p $ c_rocksdb_writeoptions_destroy wopts_p
