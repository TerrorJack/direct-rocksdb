{-# LANGUAGE RecordWildCards #-}

module Database.RocksDB.ReadOptions
  ( ReadOptions(..)
  , defaultReadOptions
  , marshalReadOptions
  ) where

import Database.RocksDB.Internals
import Database.RocksDB.Utils
import Foreign hiding (newForeignPtr)
import Foreign.Concurrent

data ReadOptions = ReadOptions
  { verityChecksums :: !(Maybe Bool)
  , fillCache :: !(Maybe Bool)
  }

defaultReadOptions :: ReadOptions
{-# INLINEABLE defaultReadOptions #-}
defaultReadOptions =
  ReadOptions {verityChecksums = Nothing, fillCache = Nothing}

marshalReadOptions :: ReadOptions -> IO (ForeignPtr RocksdbReadoptions)
{-# INLINEABLE marshalReadOptions  #-}
marshalReadOptions ReadOptions {..} = do
  ropts_p <- c_rocksdb_readoptions_create
  setBoolOptions verityChecksums $
    c_rocksdb_readoptions_set_verify_checksums ropts_p
  setBoolOptions fillCache $ c_rocksdb_readoptions_set_fill_cache ropts_p
  newForeignPtr ropts_p $ c_rocksdb_readoptions_destroy ropts_p
