{-# LANGUAGE TypeFamilies #-}

module Database.RocksDB.Marshal
  ( Marshal(..)
  ) where

class Marshal t where
  type CType t
  marshal :: t -> IO (CType t)
  finalize :: proxy t -> CType t -> IO ()
