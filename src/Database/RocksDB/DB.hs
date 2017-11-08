{-# LANGUAGE ScopedTypeVariables #-}

module Database.RocksDB.DB
  ( openDB
  , putDB
  , getDB
  ) where

import qualified Data.ByteString as BS
import qualified Data.ByteString.Unsafe as BS
import Database.RocksDB.Internals
import Database.RocksDB.Options
import Database.RocksDB.Utils
import Foreign hiding (newForeignPtr)
import Foreign.C
import Foreign.Concurrent

openDB :: Options -> FilePath -> IO (ForeignPtr Rocksdb)
{-# INLINEABLE openDB #-}
openDB opts path = do
  opts_fptr <- marshalOptions opts
  withForeignPtr opts_fptr $ \opts_ptr ->
    withCString path $ \path_ptr -> do
      db_ptr <- withErrorMessagePtr $ c_rocksdb_open opts_ptr path_ptr
      newForeignPtr db_ptr $ c_rocksdb_close db_ptr

putDB ::
     ForeignPtr Rocksdb
  -> ForeignPtr RocksdbWriteoptions
  -> BS.ByteString
  -> BS.ByteString
  -> IO ()
{-# INLINEABLE putDB #-}
putDB db_fptr wopts_fptr k_bs v_bs =
  withForeignPtr db_fptr $ \db_ptr ->
    withForeignPtr wopts_fptr $ \wopts_ptr ->
      BS.unsafeUseAsCStringLen k_bs $ \(k_buf, k_len) ->
        BS.unsafeUseAsCStringLen v_bs $ \(v_buf, v_len) ->
          withErrorMessagePtr $
          c_rocksdb_put
            db_ptr
            wopts_ptr
            k_buf
            (fromIntegral k_len)
            v_buf
            (fromIntegral v_len)

getDB ::
     ForeignPtr Rocksdb
  -> ForeignPtr RocksdbReadoptions
  -> BS.ByteString
  -> IO BS.ByteString
{-# INLINEABLE getDB #-}
getDB db_fptr ropts_fptr k_bs =
  withForeignPtr db_fptr $ \db_ptr ->
    withForeignPtr ropts_fptr $ \ropts_ptr ->
      BS.unsafeUseAsCStringLen k_bs $ \(k_buf, k_len) ->
        alloca $ \(v_len_buf :: Ptr CSize) -> do
          v_buf <-
            withErrorMessagePtr $
            c_rocksdb_get db_ptr ropts_ptr k_buf (fromIntegral k_len) v_len_buf
          v_len <- fromIntegral <$> peek v_len_buf
          BS.unsafePackMallocCStringLen (v_buf, v_len)
