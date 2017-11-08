{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}

module Database.RocksDB.Options
  ( Options(..)
  ) where

import Data.Default.Class
import Data.Foldable
import Database.RocksDB.Internals
import Database.RocksDB.Marshal
import Foreign

data Options = Options
  { totalThreads :: !(Maybe Int)
  , createIfMissing :: !(Maybe Bool)
  }

instance Default Options where
  def = Options {totalThreads = Nothing, createIfMissing = Nothing}

instance Marshal Options where
  type CType Options = Ptr RocksdbOptions
  marshal Options {..} = do
    opts_p <- c_rocksdb_options_create
    for_ totalThreads $ \total_threads ->
      c_rocksdb_options_increase_parallelism opts_p $ fromIntegral total_threads
    for_ createIfMissing $ \flag ->
      c_rocksdb_options_set_create_if_missing opts_p $
      if flag
        then 1
        else 0
    pure opts_p
  {-# INLINEABLE marshal #-}
  finalize _ = c_rocksdb_options_destroy
  {-# INLINEABLE finalize #-}
