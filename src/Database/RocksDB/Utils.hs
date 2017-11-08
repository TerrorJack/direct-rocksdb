module Database.RocksDB.Utils
  ( setIntOptions
  , setBoolOptions
  ) where

import Data.Foldable

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
