{-# LANGUAGE DeriveAnyClass #-}

module Database.RocksDB.Exceptions
  ( RocksDBException(..)
  , withErrorMessagePtr
  ) where

import Control.Exception.Safe
import qualified Data.ByteString as BS
import Foreign
import Foreign.C

newtype RocksDBException = RocksDBException
  { errorMessage :: BS.ByteString
  } deriving (Show, Exception)

withErrorMessagePtr :: (Ptr (Ptr CChar) -> IO r) -> IO r
{-# INLINEABLE withErrorMessagePtr #-}
withErrorMessagePtr cont =
  alloca $ \p -> do
    r <- cont p
    p' <- peek p
    if p' == nullPtr
      then pure r
      else do
        msg <- BS.packCString p'
        throw $ RocksDBException msg
