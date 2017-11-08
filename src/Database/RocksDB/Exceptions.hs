{-# LANGUAGE DeriveAnyClass #-}

module Database.RocksDB.Exceptions
  ( RocksDBException(..)
  ) where

import Control.Exception
import qualified Data.ByteString as BS

newtype RocksDBException = RocksDBException
  { errorMessage :: BS.ByteString
  } deriving (Show, Exception)
