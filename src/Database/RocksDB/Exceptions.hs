{-# LANGUAGE DeriveAnyClass #-}

module Database.RocksDB.Exceptions
  ( RocksDBException(..)
  ) where

import Control.Exception.Safe
import qualified Data.ByteString as BS

newtype RocksDBException = RocksDBException
  { errorMessage :: BS.ByteString
  } deriving (Show, Exception)
