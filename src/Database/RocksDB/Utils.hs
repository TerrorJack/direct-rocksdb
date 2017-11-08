module Database.RocksDB.Utils
  ( setIntOptions
  , setBoolOptions
  , withErrorMessagePtr
  ) where

import Control.Exception
import qualified Data.ByteString.Internal as BS
import qualified Data.ByteString.Unsafe as BS
import Data.Foldable
import Database.RocksDB.Exceptions
import Database.RocksDB.Internals
import Foreign
import Foreign.C

setIntOptions :: Integral t => Maybe Int -> (t -> IO ()) -> IO ()
{-# INLINEABLE setIntOptions #-}
setIntOptions field cont = for_ field $ cont . fromIntegral

setBoolOptions :: Integral t => Maybe Bool -> (t -> IO ()) -> IO ()
{-# INLINEABLE setBoolOptions #-}
setBoolOptions field cont =
  for_ field $ \val ->
    cont $
    if val
      then 1
      else 0

withErrorMessagePtr :: (Ptr (Ptr CChar) -> IO r) -> IO r
{-# INLINEABLE withErrorMessagePtr #-}
withErrorMessagePtr cont =
  alloca $ \msg_buf_p -> do
    r <- cont msg_buf_p
    msg_buf <- peek msg_buf_p
    if msg_buf == nullPtr
      then pure r
      else do
        msg_len <- fromIntegral <$> BS.c_strlen msg_buf
        msg <-
          BS.unsafePackCStringFinalizer (castPtr msg_buf) msg_len $
          c_rocksdb_free $ castPtr msg_buf
        throwIO $ RocksDBException msg
