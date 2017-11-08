module Database.RocksDB.Utils
  ( setIntOptions
  , setBoolOptions
  , withErrorMessagePtr
  ) where

import Control.Exception
import qualified Data.ByteString as BS
import Data.Foldable
import Database.RocksDB.Exceptions
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
  alloca $ \p -> do
    r <- cont p
    p' <- peek p
    if p' == nullPtr
      then pure r
      else do
        msg <- BS.packCString p'
        throwIO $ RocksDBException msg
