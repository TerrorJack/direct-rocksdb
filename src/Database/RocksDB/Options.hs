{-# LANGUAGE RecordWildCards #-}

module Database.RocksDB.Options
  ( Options(..)
  , defaultOptions
  , marshalOptions
  ) where

import Database.RocksDB.Internals
import Database.RocksDB.Utils
import Foreign hiding (newForeignPtr)
import Foreign.Concurrent

data Options = Options
  { totalThreads :: !(Maybe Int)
  , createIfMissing :: !(Maybe Bool)
  }

defaultOptions :: Options
{-# INLINEABLE defaultOptions #-}
defaultOptions = Options {totalThreads = Nothing, createIfMissing = Nothing}

marshalOptions :: Options -> IO (ForeignPtr RocksdbOptions)
{-# INLINEABLE marshalOptions #-}
marshalOptions Options {..} = do
  opts_p <- c_rocksdb_options_create
  setIntOptions totalThreads $c_rocksdb_options_increase_parallelism opts_p
  setBoolOptions createIfMissing $
    c_rocksdb_options_set_create_if_missing opts_p
  newForeignPtr opts_p $ c_rocksdb_options_destroy opts_p
