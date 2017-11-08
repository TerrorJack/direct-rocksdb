module Database.RocksDB.Internals where

import Foreign
import Foreign.C

data Rocksdb

data RocksdbBackupEngine

data RocksdbBackupEngineInfo

data RocksdbRestoreOptions

data RocksdbCache

data RocksdbCompactionfilter

data RocksdbCompactionfiltercontext

data RocksdbCompactionfilterfactory

data RocksdbComparator

data RocksdbDbpath

data RocksdbEnv

data RocksdbFifoCompactionOptions

data RocksdbFilelock

data RocksdbFilterpolicy

data RocksdbFlushoptions

data RocksdbIterator

data RocksdbLogger

data RocksdbMergeoperator

data RocksdbOptions

data RocksdbCompactoptions

data RocksdbBlockBasedTableOptions

data RocksdbCuckooTableOptions

data RocksdbRandomfile

data RocksdbReadoptions

data RocksdbSeqfile

data RocksdbSlicetransform

data RocksdbSnapshot

data RocksdbWritablefile

data RocksdbWritebatch

data RocksdbWritebatchWi

data RocksdbWriteoptions

data RocksdbUniversalCompactionOptions

data RocksdbLivefiles

data RocksdbColumnFamilyHandle

data RocksdbEnvoptions

data RocksdbIngestexternalfileoptions

data RocksdbSstfilewriter

data RocksdbRatelimiter

data RocksdbPinnableslice

data RocksdbTransactiondbOptions

data RocksdbTransactiondb

data RocksdbTransactionOptions

data RocksdbOptimistictransactiondb

data RocksdbOptimistictransactionOptions

data RocksdbTransaction

data RocksdbCheckpoint

foreign import ccall unsafe "rocksdb_open" c_rocksdb_open ::
               Ptr RocksdbOptions ->
                 Ptr CChar -> Ptr (Ptr CChar) -> IO (Ptr Rocksdb)

foreign import ccall unsafe "rocksdb_open_for_read_only"
               c_rocksdb_open_for_read_only ::
               Ptr RocksdbOptions ->
                 Ptr CChar -> CUChar -> Ptr (Ptr CChar) -> IO (Ptr Rocksdb)

foreign import ccall unsafe "rocksdb_backup_engine_open"
               c_rocksdb_backup_engine_open ::
               Ptr RocksdbOptions ->
                 Ptr CChar -> Ptr (Ptr CChar) -> IO (Ptr RocksdbBackupEngine)

foreign import ccall unsafe
               "rocksdb_backup_engine_create_new_backup"
               c_rocksdb_backup_engine_create_new_backup ::
               Ptr RocksdbBackupEngine -> Ptr Rocksdb -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe
               "rocksdb_backup_engine_purge_old_backups"
               c_rocksdb_backup_engine_purge_old_backups ::
               Ptr RocksdbBackupEngine -> Word32 -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_restore_options_create"
               c_rocksdb_restore_options_create :: IO (Ptr RocksdbRestoreOptions)

foreign import ccall unsafe "rocksdb_restore_options_destroy"
               c_rocksdb_restore_options_destroy ::
               Ptr RocksdbRestoreOptions -> IO ()

foreign import ccall unsafe
               "rocksdb_restore_options_set_keep_log_files"
               c_rocksdb_restore_options_set_keep_log_files ::
               Ptr RocksdbRestoreOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_backup_engine_restore_db_from_latest_backup"
               c_rocksdb_backup_engine_restore_db_from_latest_backup ::
               Ptr RocksdbBackupEngine ->
                 Ptr CChar ->
                   Ptr CChar -> Ptr RocksdbRestoreOptions -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_backup_engine_get_backup_info"
               c_rocksdb_backup_engine_get_backup_info ::
               Ptr RocksdbBackupEngine -> IO (Ptr RocksdbBackupEngineInfo)

foreign import ccall unsafe "rocksdb_backup_engine_info_count"
               c_rocksdb_backup_engine_info_count ::
               Ptr RocksdbBackupEngineInfo -> IO CInt

foreign import ccall unsafe "rocksdb_backup_engine_info_timestamp"
               c_rocksdb_backup_engine_info_timestamp ::
               Ptr RocksdbBackupEngineInfo -> CInt -> IO Int64

foreign import ccall unsafe "rocksdb_backup_engine_info_backup_id"
               c_rocksdb_backup_engine_info_backup_id ::
               Ptr RocksdbBackupEngineInfo -> CInt -> IO Word32

foreign import ccall unsafe "rocksdb_backup_engine_info_size"
               c_rocksdb_backup_engine_info_size ::
               Ptr RocksdbBackupEngineInfo -> CInt -> IO Word64

foreign import ccall unsafe
               "rocksdb_backup_engine_info_number_files"
               c_rocksdb_backup_engine_info_number_files ::
               Ptr RocksdbBackupEngineInfo -> CInt -> IO Word32

foreign import ccall unsafe "rocksdb_backup_engine_info_destroy"
               c_rocksdb_backup_engine_info_destroy ::
               Ptr RocksdbBackupEngineInfo -> IO ()

foreign import ccall unsafe "rocksdb_backup_engine_close"
               c_rocksdb_backup_engine_close :: Ptr RocksdbBackupEngine -> IO ()

foreign import ccall unsafe "rocksdb_checkpoint_object_create"
               c_rocksdb_checkpoint_object_create ::
               Ptr Rocksdb -> Ptr (Ptr CChar) -> IO (Ptr RocksdbCheckpoint)

foreign import ccall unsafe "rocksdb_checkpoint_create"
               c_rocksdb_checkpoint_create ::
               Ptr RocksdbCheckpoint ->
                 Ptr CChar -> Word64 -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_checkpoint_object_destroy"
               c_rocksdb_checkpoint_object_destroy ::
               Ptr RocksdbCheckpoint -> IO ()

foreign import ccall unsafe "rocksdb_open_column_families"
               c_rocksdb_open_column_families ::
               Ptr RocksdbOptions ->
                 Ptr CChar ->
                   CInt ->
                     Ptr (Ptr CChar) ->
                       Ptr (Ptr RocksdbOptions) ->
                         Ptr (Ptr RocksdbColumnFamilyHandle) ->
                           Ptr (Ptr CChar) -> IO (Ptr Rocksdb)

foreign import ccall unsafe
               "rocksdb_open_for_read_only_column_families"
               c_rocksdb_open_for_read_only_column_families ::
               Ptr RocksdbOptions ->
                 Ptr CChar ->
                   CInt ->
                     Ptr (Ptr CChar) ->
                       Ptr (Ptr RocksdbOptions) ->
                         Ptr (Ptr RocksdbColumnFamilyHandle) ->
                           CUChar -> Ptr (Ptr CChar) -> IO (Ptr Rocksdb)

foreign import ccall unsafe "rocksdb_list_column_families"
               c_rocksdb_list_column_families ::
               Ptr RocksdbOptions ->
                 Ptr CChar -> Ptr CSize -> Ptr (Ptr CChar) -> IO (Ptr (Ptr CChar))

foreign import ccall unsafe "rocksdb_list_column_families_destroy"
               c_rocksdb_list_column_families_destroy ::
               Ptr (Ptr CChar) -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_create_column_family"
               c_rocksdb_create_column_family ::
               Ptr Rocksdb ->
                 Ptr RocksdbOptions ->
                   Ptr CChar -> Ptr (Ptr CChar) -> IO (Ptr RocksdbColumnFamilyHandle)

foreign import ccall unsafe "rocksdb_drop_column_family"
               c_rocksdb_drop_column_family ::
               Ptr Rocksdb ->
                 Ptr RocksdbColumnFamilyHandle -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_column_family_handle_destroy"
               c_rocksdb_column_family_handle_destroy ::
               Ptr RocksdbColumnFamilyHandle -> IO ()

foreign import ccall unsafe "rocksdb_close" c_rocksdb_close ::
               Ptr Rocksdb -> IO ()

foreign import ccall unsafe "rocksdb_put" c_rocksdb_put ::
               Ptr Rocksdb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr CChar ->
                     CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_put_cf" c_rocksdb_put_cf ::
               Ptr Rocksdb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr RocksdbColumnFamilyHandle ->
                     Ptr CChar ->
                       CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_delete" c_rocksdb_delete ::
               Ptr Rocksdb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_delete_cf" c_rocksdb_delete_cf
               ::
               Ptr Rocksdb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr RocksdbColumnFamilyHandle ->
                     Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_merge" c_rocksdb_merge ::
               Ptr Rocksdb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr CChar ->
                     CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_merge_cf" c_rocksdb_merge_cf
               ::
               Ptr Rocksdb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr RocksdbColumnFamilyHandle ->
                     Ptr CChar ->
                       CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_write" c_rocksdb_write ::
               Ptr Rocksdb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr RocksdbWritebatch -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_get" c_rocksdb_get ::
               Ptr Rocksdb ->
                 Ptr RocksdbReadoptions ->
                   Ptr CChar ->
                     CSize -> Ptr CSize -> Ptr (Ptr CChar) -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_get_cf" c_rocksdb_get_cf ::
               Ptr Rocksdb ->
                 Ptr RocksdbReadoptions ->
                   Ptr RocksdbColumnFamilyHandle ->
                     Ptr CChar ->
                       CSize -> Ptr CSize -> Ptr (Ptr CChar) -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_multi_get" c_rocksdb_multi_get
               ::
               Ptr Rocksdb ->
                 Ptr RocksdbReadoptions ->
                   CSize ->
                     Ptr (Ptr CChar) ->
                       Ptr CSize ->
                         Ptr (Ptr CChar) -> Ptr CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_multi_get_cf"
               c_rocksdb_multi_get_cf ::
               Ptr Rocksdb ->
                 Ptr RocksdbReadoptions ->
                   Ptr (Ptr RocksdbColumnFamilyHandle) ->
                     CSize ->
                       Ptr (Ptr CChar) ->
                         Ptr CSize ->
                           Ptr (Ptr CChar) -> Ptr CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_create_iterator"
               c_rocksdb_create_iterator ::
               Ptr Rocksdb -> Ptr RocksdbReadoptions -> IO (Ptr RocksdbIterator)

foreign import ccall unsafe "rocksdb_create_iterator_cf"
               c_rocksdb_create_iterator_cf ::
               Ptr Rocksdb ->
                 Ptr RocksdbReadoptions ->
                   Ptr RocksdbColumnFamilyHandle -> IO (Ptr RocksdbIterator)

foreign import ccall unsafe "rocksdb_create_iterators"
               c_rocksdb_create_iterators ::
               Ptr Rocksdb ->
                 Ptr RocksdbReadoptions ->
                   Ptr (Ptr RocksdbColumnFamilyHandle) ->
                     Ptr (Ptr RocksdbIterator) -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_create_snapshot"
               c_rocksdb_create_snapshot ::
               Ptr Rocksdb -> IO (Ptr RocksdbSnapshot)

foreign import ccall unsafe "rocksdb_release_snapshot"
               c_rocksdb_release_snapshot ::
               Ptr Rocksdb -> Ptr RocksdbSnapshot -> IO ()

foreign import ccall unsafe "rocksdb_property_value"
               c_rocksdb_property_value ::
               Ptr Rocksdb -> Ptr CChar -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_property_int"
               c_rocksdb_property_int ::
               Ptr Rocksdb -> Ptr CChar -> Ptr Word64 -> IO CInt

foreign import ccall unsafe "rocksdb_property_value_cf"
               c_rocksdb_property_value_cf ::
               Ptr Rocksdb ->
                 Ptr RocksdbColumnFamilyHandle -> Ptr CChar -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_approximate_sizes"
               c_rocksdb_approximate_sizes ::
               Ptr Rocksdb ->
                 CInt ->
                   Ptr (Ptr CChar) ->
                     Ptr CSize -> Ptr (Ptr CChar) -> Ptr CSize -> Ptr Word64 -> IO ()

foreign import ccall unsafe "rocksdb_approximate_sizes_cf"
               c_rocksdb_approximate_sizes_cf ::
               Ptr Rocksdb ->
                 Ptr RocksdbColumnFamilyHandle ->
                   CInt ->
                     Ptr (Ptr CChar) ->
                       Ptr CSize -> Ptr (Ptr CChar) -> Ptr CSize -> Ptr Word64 -> IO ()

foreign import ccall unsafe "rocksdb_compact_range"
               c_rocksdb_compact_range ::
               Ptr Rocksdb -> Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_compact_range_cf"
               c_rocksdb_compact_range_cf ::
               Ptr Rocksdb ->
                 Ptr RocksdbColumnFamilyHandle ->
                   Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_compact_range_opt"
               c_rocksdb_compact_range_opt ::
               Ptr Rocksdb ->
                 Ptr RocksdbCompactoptions ->
                   Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_compact_range_cf_opt"
               c_rocksdb_compact_range_cf_opt ::
               Ptr Rocksdb ->
                 Ptr RocksdbColumnFamilyHandle ->
                   Ptr RocksdbCompactoptions ->
                     Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_delete_file"
               c_rocksdb_delete_file :: Ptr Rocksdb -> Ptr CChar -> IO ()

foreign import ccall unsafe "rocksdb_livefiles" c_rocksdb_livefiles
               :: Ptr Rocksdb -> IO (Ptr RocksdbLivefiles)

foreign import ccall unsafe "rocksdb_flush" c_rocksdb_flush ::
               Ptr Rocksdb -> Ptr RocksdbFlushoptions -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_disable_file_deletions"
               c_rocksdb_disable_file_deletions ::
               Ptr Rocksdb -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_enable_file_deletions"
               c_rocksdb_enable_file_deletions ::
               Ptr Rocksdb -> CUChar -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_destroy_db"
               c_rocksdb_destroy_db ::
               Ptr RocksdbOptions -> Ptr CChar -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_repair_db" c_rocksdb_repair_db
               :: Ptr RocksdbOptions -> Ptr CChar -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_iter_destroy"
               c_rocksdb_iter_destroy :: Ptr RocksdbIterator -> IO ()

foreign import ccall unsafe "rocksdb_iter_valid"
               c_rocksdb_iter_valid :: Ptr RocksdbIterator -> IO CUChar

foreign import ccall unsafe "rocksdb_iter_seek_to_first"
               c_rocksdb_iter_seek_to_first :: Ptr RocksdbIterator -> IO ()

foreign import ccall unsafe "rocksdb_iter_seek_to_last"
               c_rocksdb_iter_seek_to_last :: Ptr RocksdbIterator -> IO ()

foreign import ccall unsafe "rocksdb_iter_seek" c_rocksdb_iter_seek
               :: Ptr RocksdbIterator -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_iter_seek_for_prev"
               c_rocksdb_iter_seek_for_prev ::
               Ptr RocksdbIterator -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_iter_next" c_rocksdb_iter_next
               :: Ptr RocksdbIterator -> IO ()

foreign import ccall unsafe "rocksdb_iter_prev" c_rocksdb_iter_prev
               :: Ptr RocksdbIterator -> IO ()

foreign import ccall unsafe "rocksdb_iter_key" c_rocksdb_iter_key
               :: Ptr RocksdbIterator -> Ptr CSize -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_iter_value"
               c_rocksdb_iter_value ::
               Ptr RocksdbIterator -> Ptr CSize -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_iter_get_error"
               c_rocksdb_iter_get_error ::
               Ptr RocksdbIterator -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_create"
               c_rocksdb_writebatch_create :: IO (Ptr RocksdbWritebatch)

foreign import ccall unsafe "rocksdb_writebatch_create_from"
               c_rocksdb_writebatch_create_from ::
               Ptr CChar -> CSize -> IO (Ptr RocksdbWritebatch)

foreign import ccall unsafe "rocksdb_writebatch_destroy"
               c_rocksdb_writebatch_destroy :: Ptr RocksdbWritebatch -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_clear"
               c_rocksdb_writebatch_clear :: Ptr RocksdbWritebatch -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_count"
               c_rocksdb_writebatch_count :: Ptr RocksdbWritebatch -> IO CInt

foreign import ccall unsafe "rocksdb_writebatch_put"
               c_rocksdb_writebatch_put ::
               Ptr RocksdbWritebatch ->
                 Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_put_cf"
               c_rocksdb_writebatch_put_cf ::
               Ptr RocksdbWritebatch ->
                 Ptr RocksdbColumnFamilyHandle ->
                   Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_putv"
               c_rocksdb_writebatch_putv ::
               Ptr RocksdbWritebatch ->
                 CInt ->
                   Ptr (Ptr CChar) ->
                     Ptr CSize -> CInt -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_putv_cf"
               c_rocksdb_writebatch_putv_cf ::
               Ptr RocksdbWritebatch ->
                 Ptr RocksdbColumnFamilyHandle ->
                   CInt ->
                     Ptr (Ptr CChar) ->
                       Ptr CSize -> CInt -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_merge"
               c_rocksdb_writebatch_merge ::
               Ptr RocksdbWritebatch ->
                 Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_merge_cf"
               c_rocksdb_writebatch_merge_cf ::
               Ptr RocksdbWritebatch ->
                 Ptr RocksdbColumnFamilyHandle ->
                   Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_mergev"
               c_rocksdb_writebatch_mergev ::
               Ptr RocksdbWritebatch ->
                 CInt ->
                   Ptr (Ptr CChar) ->
                     Ptr CSize -> CInt -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_mergev_cf"
               c_rocksdb_writebatch_mergev_cf ::
               Ptr RocksdbWritebatch ->
                 Ptr RocksdbColumnFamilyHandle ->
                   CInt ->
                     Ptr (Ptr CChar) ->
                       Ptr CSize -> CInt -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_delete"
               c_rocksdb_writebatch_delete ::
               Ptr RocksdbWritebatch -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_delete_cf"
               c_rocksdb_writebatch_delete_cf ::
               Ptr RocksdbWritebatch ->
                 Ptr RocksdbColumnFamilyHandle -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_deletev"
               c_rocksdb_writebatch_deletev ::
               Ptr RocksdbWritebatch ->
                 CInt -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_deletev_cf"
               c_rocksdb_writebatch_deletev_cf ::
               Ptr RocksdbWritebatch ->
                 Ptr RocksdbColumnFamilyHandle ->
                   CInt -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_delete_range"
               c_rocksdb_writebatch_delete_range ::
               Ptr RocksdbWritebatch ->
                 Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_delete_range_cf"
               c_rocksdb_writebatch_delete_range_cf ::
               Ptr RocksdbWritebatch ->
                 Ptr RocksdbColumnFamilyHandle ->
                   Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_delete_rangev"
               c_rocksdb_writebatch_delete_rangev ::
               Ptr RocksdbWritebatch ->
                 CInt ->
                   Ptr (Ptr CChar) ->
                     Ptr CSize -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_delete_rangev_cf"
               c_rocksdb_writebatch_delete_rangev_cf ::
               Ptr RocksdbWritebatch ->
                 Ptr RocksdbColumnFamilyHandle ->
                   CInt ->
                     Ptr (Ptr CChar) ->
                       Ptr CSize -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_put_log_data"
               c_rocksdb_writebatch_put_log_data ::
               Ptr RocksdbWritebatch -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_iterate"
               c_rocksdb_writebatch_iterate ::
               Ptr RocksdbWritebatch ->
                 Ptr () ->
                   FunPtr
                     (Ptr () -> Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ())
                     -> FunPtr (Ptr () -> Ptr CChar -> CSize -> IO ()) -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_data"
               c_rocksdb_writebatch_data ::
               Ptr RocksdbWritebatch -> Ptr CSize -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_writebatch_set_save_point"
               c_rocksdb_writebatch_set_save_point ::
               Ptr RocksdbWritebatch -> IO ()

foreign import ccall unsafe
               "rocksdb_writebatch_rollback_to_save_point"
               c_rocksdb_writebatch_rollback_to_save_point ::
               Ptr RocksdbWritebatch -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_pop_save_point"
               c_rocksdb_writebatch_pop_save_point ::
               Ptr RocksdbWritebatch -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_create"
               c_rocksdb_writebatch_wi_create ::
               CSize -> CUChar -> IO (Ptr RocksdbWritebatchWi)

foreign import ccall unsafe "rocksdb_writebatch_wi_destroy"
               c_rocksdb_writebatch_wi_destroy :: Ptr RocksdbWritebatchWi -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_clear"
               c_rocksdb_writebatch_wi_clear :: Ptr RocksdbWritebatchWi -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_count"
               c_rocksdb_writebatch_wi_count :: Ptr RocksdbWritebatchWi -> IO CInt

foreign import ccall unsafe "rocksdb_writebatch_wi_put"
               c_rocksdb_writebatch_wi_put ::
               Ptr RocksdbWritebatchWi ->
                 Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_put_cf"
               c_rocksdb_writebatch_wi_put_cf ::
               Ptr RocksdbWritebatchWi ->
                 Ptr RocksdbColumnFamilyHandle ->
                   Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_putv"
               c_rocksdb_writebatch_wi_putv ::
               Ptr RocksdbWritebatchWi ->
                 CInt ->
                   Ptr (Ptr CChar) ->
                     Ptr CSize -> CInt -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_putv_cf"
               c_rocksdb_writebatch_wi_putv_cf ::
               Ptr RocksdbWritebatchWi ->
                 Ptr RocksdbColumnFamilyHandle ->
                   CInt ->
                     Ptr (Ptr CChar) ->
                       Ptr CSize -> CInt -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_merge"
               c_rocksdb_writebatch_wi_merge ::
               Ptr RocksdbWritebatchWi ->
                 Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_merge_cf"
               c_rocksdb_writebatch_wi_merge_cf ::
               Ptr RocksdbWritebatchWi ->
                 Ptr RocksdbColumnFamilyHandle ->
                   Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_mergev"
               c_rocksdb_writebatch_wi_mergev ::
               Ptr RocksdbWritebatchWi ->
                 CInt ->
                   Ptr (Ptr CChar) ->
                     Ptr CSize -> CInt -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_mergev_cf"
               c_rocksdb_writebatch_wi_mergev_cf ::
               Ptr RocksdbWritebatchWi ->
                 Ptr RocksdbColumnFamilyHandle ->
                   CInt ->
                     Ptr (Ptr CChar) ->
                       Ptr CSize -> CInt -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_delete"
               c_rocksdb_writebatch_wi_delete ::
               Ptr RocksdbWritebatchWi -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_delete_cf"
               c_rocksdb_writebatch_wi_delete_cf ::
               Ptr RocksdbWritebatchWi ->
                 Ptr RocksdbColumnFamilyHandle -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_deletev"
               c_rocksdb_writebatch_wi_deletev ::
               Ptr RocksdbWritebatchWi ->
                 CInt -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_deletev_cf"
               c_rocksdb_writebatch_wi_deletev_cf ::
               Ptr RocksdbWritebatchWi ->
                 Ptr RocksdbColumnFamilyHandle ->
                   CInt -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_delete_range"
               c_rocksdb_writebatch_wi_delete_range ::
               Ptr RocksdbWritebatchWi ->
                 Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_delete_range_cf"
               c_rocksdb_writebatch_wi_delete_range_cf ::
               Ptr RocksdbWritebatchWi ->
                 Ptr RocksdbColumnFamilyHandle ->
                   Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_delete_rangev"
               c_rocksdb_writebatch_wi_delete_rangev ::
               Ptr RocksdbWritebatchWi ->
                 CInt ->
                   Ptr (Ptr CChar) ->
                     Ptr CSize -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_writebatch_wi_delete_rangev_cf"
               c_rocksdb_writebatch_wi_delete_rangev_cf ::
               Ptr RocksdbWritebatchWi ->
                 Ptr RocksdbColumnFamilyHandle ->
                   CInt ->
                     Ptr (Ptr CChar) ->
                       Ptr CSize -> Ptr (Ptr CChar) -> Ptr CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_put_log_data"
               c_rocksdb_writebatch_wi_put_log_data ::
               Ptr RocksdbWritebatchWi -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_iterate"
               c_rocksdb_writebatch_wi_iterate ::
               Ptr RocksdbWritebatchWi ->
                 Ptr () ->
                   FunPtr
                     (Ptr () -> Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO ())
                     -> FunPtr (Ptr () -> Ptr CChar -> CSize -> IO ()) -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_data"
               c_rocksdb_writebatch_wi_data ::
               Ptr RocksdbWritebatchWi -> Ptr CSize -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_writebatch_wi_set_save_point"
               c_rocksdb_writebatch_wi_set_save_point ::
               Ptr RocksdbWritebatchWi -> IO ()

foreign import ccall unsafe
               "rocksdb_writebatch_wi_rollback_to_save_point"
               c_rocksdb_writebatch_wi_rollback_to_save_point ::
               Ptr RocksdbWritebatchWi -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_writebatch_wi_get_from_batch"
               c_rocksdb_writebatch_wi_get_from_batch ::
               Ptr RocksdbWritebatchWi ->
                 Ptr RocksdbOptions ->
                   Ptr CChar ->
                     CSize -> Ptr CSize -> Ptr (Ptr CChar) -> IO (Ptr CChar)

foreign import ccall unsafe
               "rocksdb_writebatch_wi_get_from_batch_cf"
               c_rocksdb_writebatch_wi_get_from_batch_cf ::
               Ptr RocksdbWritebatchWi ->
                 Ptr RocksdbOptions ->
                   Ptr RocksdbColumnFamilyHandle ->
                     Ptr CChar ->
                       CSize -> Ptr CSize -> Ptr (Ptr CChar) -> IO (Ptr CChar)

foreign import ccall unsafe
               "rocksdb_writebatch_wi_get_from_batch_and_db"
               c_rocksdb_writebatch_wi_get_from_batch_and_db ::
               Ptr RocksdbWritebatchWi ->
                 Ptr Rocksdb ->
                   Ptr RocksdbReadoptions ->
                     Ptr CChar ->
                       CSize -> Ptr CSize -> Ptr (Ptr CChar) -> IO (Ptr CChar)

foreign import ccall unsafe
               "rocksdb_writebatch_wi_get_from_batch_and_db_cf"
               c_rocksdb_writebatch_wi_get_from_batch_and_db_cf ::
               Ptr RocksdbWritebatchWi ->
                 Ptr Rocksdb ->
                   Ptr RocksdbReadoptions ->
                     Ptr RocksdbColumnFamilyHandle ->
                       Ptr CChar ->
                         CSize -> Ptr CSize -> Ptr (Ptr CChar) -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_write_writebatch_wi"
               c_rocksdb_write_writebatch_wi ::
               Ptr Rocksdb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr RocksdbWritebatchWi -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe
               "rocksdb_writebatch_wi_create_iterator_with_base"
               c_rocksdb_writebatch_wi_create_iterator_with_base ::
               Ptr RocksdbWritebatchWi ->
                 Ptr RocksdbIterator -> IO (Ptr RocksdbIterator)

foreign import ccall unsafe
               "rocksdb_writebatch_wi_create_iterator_with_base_cf"
               c_rocksdb_writebatch_wi_create_iterator_with_base_cf ::
               Ptr RocksdbWritebatchWi ->
                 Ptr RocksdbIterator ->
                   Ptr RocksdbColumnFamilyHandle -> IO (Ptr RocksdbIterator)

foreign import ccall unsafe "rocksdb_block_based_options_create"
               c_rocksdb_block_based_options_create ::
               IO (Ptr RocksdbBlockBasedTableOptions)

foreign import ccall unsafe "rocksdb_block_based_options_destroy"
               c_rocksdb_block_based_options_destroy ::
               Ptr RocksdbBlockBasedTableOptions -> IO ()

foreign import ccall unsafe
               "rocksdb_block_based_options_set_block_size"
               c_rocksdb_block_based_options_set_block_size ::
               Ptr RocksdbBlockBasedTableOptions -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_block_based_options_set_block_size_deviation"
               c_rocksdb_block_based_options_set_block_size_deviation ::
               Ptr RocksdbBlockBasedTableOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_block_based_options_set_block_restart_interval"
               c_rocksdb_block_based_options_set_block_restart_interval ::
               Ptr RocksdbBlockBasedTableOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_block_based_options_set_filter_policy"
               c_rocksdb_block_based_options_set_filter_policy ::
               Ptr RocksdbBlockBasedTableOptions ->
                 Ptr RocksdbFilterpolicy -> IO ()

foreign import ccall unsafe
               "rocksdb_block_based_options_set_no_block_cache"
               c_rocksdb_block_based_options_set_no_block_cache ::
               Ptr RocksdbBlockBasedTableOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_block_based_options_set_block_cache"
               c_rocksdb_block_based_options_set_block_cache ::
               Ptr RocksdbBlockBasedTableOptions -> Ptr RocksdbCache -> IO ()

foreign import ccall unsafe
               "rocksdb_block_based_options_set_block_cache_compressed"
               c_rocksdb_block_based_options_set_block_cache_compressed ::
               Ptr RocksdbBlockBasedTableOptions -> Ptr RocksdbCache -> IO ()

foreign import ccall unsafe
               "rocksdb_block_based_options_set_whole_key_filtering"
               c_rocksdb_block_based_options_set_whole_key_filtering ::
               Ptr RocksdbBlockBasedTableOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_block_based_options_set_format_version"
               c_rocksdb_block_based_options_set_format_version ::
               Ptr RocksdbBlockBasedTableOptions -> CInt -> IO ()

c_rocksdb_block_based_table_index_type_binary_search, c_rocksdb_block_based_table_index_type_hash_search, c_rocksdb_block_based_table_index_type_two_level_index_search ::
     CInt
c_rocksdb_block_based_table_index_type_binary_search = 0

c_rocksdb_block_based_table_index_type_hash_search = 1

c_rocksdb_block_based_table_index_type_two_level_index_search = 2

foreign import ccall unsafe
               "rocksdb_block_based_options_set_index_type"
               c_rocksdb_block_based_options_set_index_type ::
               Ptr RocksdbBlockBasedTableOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_block_based_options_set_hash_index_allow_collision"
               c_rocksdb_block_based_options_set_hash_index_allow_collision ::
               Ptr RocksdbBlockBasedTableOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_block_based_options_set_cache_index_and_filter_blocks"
               c_rocksdb_block_based_options_set_cache_index_and_filter_blocks ::
               Ptr RocksdbBlockBasedTableOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_block_based_options_set_pin_l0_filter_and_index_blocks_in_cache"
               c_rocksdb_block_based_options_set_pin_l0_filter_and_index_blocks_in_cache
               :: Ptr RocksdbBlockBasedTableOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_block_based_table_factory"
               c_rocksdb_options_set_block_based_table_factory ::
               Ptr RocksdbOptions -> Ptr RocksdbBlockBasedTableOptions -> IO ()

foreign import ccall unsafe "rocksdb_cuckoo_options_create"
               c_rocksdb_cuckoo_options_create ::
               IO (Ptr RocksdbCuckooTableOptions)

foreign import ccall unsafe "rocksdb_cuckoo_options_destroy"
               c_rocksdb_cuckoo_options_destroy ::
               Ptr RocksdbCuckooTableOptions -> IO ()

foreign import ccall unsafe "rocksdb_cuckoo_options_set_hash_ratio"
               c_rocksdb_cuckoo_options_set_hash_ratio ::
               Ptr RocksdbCuckooTableOptions -> CDouble -> IO ()

foreign import ccall unsafe
               "rocksdb_cuckoo_options_set_max_search_depth"
               c_rocksdb_cuckoo_options_set_max_search_depth ::
               Ptr RocksdbCuckooTableOptions -> Word32 -> IO ()

foreign import ccall unsafe
               "rocksdb_cuckoo_options_set_cuckoo_block_size"
               c_rocksdb_cuckoo_options_set_cuckoo_block_size ::
               Ptr RocksdbCuckooTableOptions -> Word32 -> IO ()

foreign import ccall unsafe
               "rocksdb_cuckoo_options_set_identity_as_first_hash"
               c_rocksdb_cuckoo_options_set_identity_as_first_hash ::
               Ptr RocksdbCuckooTableOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_cuckoo_options_set_use_module_hash"
               c_rocksdb_cuckoo_options_set_use_module_hash ::
               Ptr RocksdbCuckooTableOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_cuckoo_table_factory"
               c_rocksdb_options_set_cuckoo_table_factory ::
               Ptr RocksdbOptions -> Ptr RocksdbCuckooTableOptions -> IO ()

foreign import ccall unsafe "rocksdb_set_options"
               c_rocksdb_set_options ::
               Ptr Rocksdb ->
                 CInt ->
                   Ptr (Ptr CChar) -> Ptr (Ptr CChar) -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_options_create"
               c_rocksdb_options_create :: IO (Ptr RocksdbOptions)

foreign import ccall unsafe "rocksdb_options_destroy"
               c_rocksdb_options_destroy :: Ptr RocksdbOptions -> IO ()

foreign import ccall unsafe "rocksdb_options_increase_parallelism"
               c_rocksdb_options_increase_parallelism ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_optimize_for_point_lookup"
               c_rocksdb_options_optimize_for_point_lookup ::
               Ptr RocksdbOptions -> Word64 -> IO ()

foreign import ccall unsafe
               "rocksdb_options_optimize_level_style_compaction"
               c_rocksdb_options_optimize_level_style_compaction ::
               Ptr RocksdbOptions -> Word64 -> IO ()

foreign import ccall unsafe
               "rocksdb_options_optimize_universal_style_compaction"
               c_rocksdb_options_optimize_universal_style_compaction ::
               Ptr RocksdbOptions -> Word64 -> IO ()

foreign import ccall unsafe "rocksdb_options_set_compaction_filter"
               c_rocksdb_options_set_compaction_filter ::
               Ptr RocksdbOptions -> Ptr RocksdbCompactionfilter -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_compaction_filter_factory"
               c_rocksdb_options_set_compaction_filter_factory ::
               Ptr RocksdbOptions -> Ptr RocksdbCompactionfilterfactory -> IO ()

foreign import ccall unsafe
               "rocksdb_options_compaction_readahead_size"
               c_rocksdb_options_compaction_readahead_size ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_options_set_comparator"
               c_rocksdb_options_set_comparator ::
               Ptr RocksdbOptions -> Ptr RocksdbComparator -> IO ()

foreign import ccall unsafe "rocksdb_options_set_merge_operator"
               c_rocksdb_options_set_merge_operator ::
               Ptr RocksdbOptions -> Ptr RocksdbMergeoperator -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_uint64add_merge_operator"
               c_rocksdb_options_set_uint64add_merge_operator ::
               Ptr RocksdbOptions -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_compression_per_level"
               c_rocksdb_options_set_compression_per_level ::
               Ptr RocksdbOptions -> Ptr CInt -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_options_set_create_if_missing"
               c_rocksdb_options_set_create_if_missing ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_create_missing_column_families"
               c_rocksdb_options_set_create_missing_column_families ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_options_set_error_if_exists"
               c_rocksdb_options_set_error_if_exists ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_options_set_paranoid_checks"
               c_rocksdb_options_set_paranoid_checks ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_options_set_db_paths"
               c_rocksdb_options_set_db_paths ::
               Ptr RocksdbOptions -> Ptr (Ptr RocksdbDbpath) -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_options_set_env"
               c_rocksdb_options_set_env ::
               Ptr RocksdbOptions -> Ptr RocksdbEnv -> IO ()

foreign import ccall unsafe "rocksdb_options_set_info_log"
               c_rocksdb_options_set_info_log ::
               Ptr RocksdbOptions -> Ptr RocksdbLogger -> IO ()

foreign import ccall unsafe "rocksdb_options_set_info_log_level"
               c_rocksdb_options_set_info_log_level ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe "rocksdb_options_set_write_buffer_size"
               c_rocksdb_options_set_write_buffer_size ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_db_write_buffer_size"
               c_rocksdb_options_set_db_write_buffer_size ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_options_set_max_open_files"
               c_rocksdb_options_set_max_open_files ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_max_file_opening_threads"
               c_rocksdb_options_set_max_file_opening_threads ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_max_total_wal_size"
               c_rocksdb_options_set_max_total_wal_size ::
               Ptr RocksdbOptions -> Word64 -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_compression_options"
               c_rocksdb_options_set_compression_options ::
               Ptr RocksdbOptions -> CInt -> CInt -> CInt -> CInt -> IO ()

foreign import ccall unsafe "rocksdb_options_set_prefix_extractor"
               c_rocksdb_options_set_prefix_extractor ::
               Ptr RocksdbOptions -> Ptr RocksdbSlicetransform -> IO ()

foreign import ccall unsafe "rocksdb_options_set_num_levels"
               c_rocksdb_options_set_num_levels ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_level0_file_num_compaction_trigger"
               c_rocksdb_options_set_level0_file_num_compaction_trigger ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_level0_slowdown_writes_trigger"
               c_rocksdb_options_set_level0_slowdown_writes_trigger ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_level0_stop_writes_trigger"
               c_rocksdb_options_set_level0_stop_writes_trigger ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_max_mem_compaction_level"
               c_rocksdb_options_set_max_mem_compaction_level ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_target_file_size_base"
               c_rocksdb_options_set_target_file_size_base ::
               Ptr RocksdbOptions -> Word64 -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_target_file_size_multiplier"
               c_rocksdb_options_set_target_file_size_multiplier ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_max_bytes_for_level_base"
               c_rocksdb_options_set_max_bytes_for_level_base ::
               Ptr RocksdbOptions -> Word64 -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_level_compaction_dynamic_level_bytes"
               c_rocksdb_options_set_level_compaction_dynamic_level_bytes ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_max_bytes_for_level_multiplier"
               c_rocksdb_options_set_max_bytes_for_level_multiplier ::
               Ptr RocksdbOptions -> CDouble -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_max_bytes_for_level_multiplier_additional"
               c_rocksdb_options_set_max_bytes_for_level_multiplier_additional ::
               Ptr RocksdbOptions -> Ptr CInt -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_options_enable_statistics"
               c_rocksdb_options_enable_statistics :: Ptr RocksdbOptions -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_skip_stats_update_on_db_open"
               c_rocksdb_options_set_skip_stats_update_on_db_open ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_options_statistics_get_string"
               c_rocksdb_options_statistics_get_string ::
               Ptr RocksdbOptions -> IO (Ptr CChar)

foreign import ccall unsafe
               "rocksdb_options_set_max_write_buffer_number"
               c_rocksdb_options_set_max_write_buffer_number ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_min_write_buffer_number_to_merge"
               c_rocksdb_options_set_min_write_buffer_number_to_merge ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_max_write_buffer_number_to_maintain"
               c_rocksdb_options_set_max_write_buffer_number_to_maintain ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_max_background_compactions"
               c_rocksdb_options_set_max_background_compactions ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_base_background_compactions"
               c_rocksdb_options_set_base_background_compactions ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_max_background_flushes"
               c_rocksdb_options_set_max_background_flushes ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe "rocksdb_options_set_max_log_file_size"
               c_rocksdb_options_set_max_log_file_size ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_log_file_time_to_roll"
               c_rocksdb_options_set_log_file_time_to_roll ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_options_set_keep_log_file_num"
               c_rocksdb_options_set_keep_log_file_num ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_recycle_log_file_num"
               c_rocksdb_options_set_recycle_log_file_num ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_options_set_soft_rate_limit"
               c_rocksdb_options_set_soft_rate_limit ::
               Ptr RocksdbOptions -> CDouble -> IO ()

foreign import ccall unsafe "rocksdb_options_set_hard_rate_limit"
               c_rocksdb_options_set_hard_rate_limit ::
               Ptr RocksdbOptions -> CDouble -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_soft_pending_compaction_bytes_limit"
               c_rocksdb_options_set_soft_pending_compaction_bytes_limit ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_hard_pending_compaction_bytes_limit"
               c_rocksdb_options_set_hard_pending_compaction_bytes_limit ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_rate_limit_delay_max_milliseconds"
               c_rocksdb_options_set_rate_limit_delay_max_milliseconds ::
               Ptr RocksdbOptions -> CUInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_max_manifest_file_size"
               c_rocksdb_options_set_max_manifest_file_size ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_table_cache_numshardbits"
               c_rocksdb_options_set_table_cache_numshardbits ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_table_cache_remove_scan_count_limit"
               c_rocksdb_options_set_table_cache_remove_scan_count_limit ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe "rocksdb_options_set_arena_block_size"
               c_rocksdb_options_set_arena_block_size ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_options_set_use_fsync"
               c_rocksdb_options_set_use_fsync ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe "rocksdb_options_set_db_log_dir"
               c_rocksdb_options_set_db_log_dir ::
               Ptr RocksdbOptions -> Ptr CChar -> IO ()

foreign import ccall unsafe "rocksdb_options_set_wal_dir"
               c_rocksdb_options_set_wal_dir ::
               Ptr RocksdbOptions -> Ptr CChar -> IO ()

foreign import ccall unsafe "rocksdb_options_set_WAL_ttl_seconds"
               c_rocksdb_options_set_WAL_ttl_seconds ::
               Ptr RocksdbOptions -> Word64 -> IO ()

foreign import ccall unsafe "rocksdb_options_set_WAL_size_limit_MB"
               c_rocksdb_options_set_WAL_size_limit_MB ::
               Ptr RocksdbOptions -> Word64 -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_manifest_preallocation_size"
               c_rocksdb_options_set_manifest_preallocation_size ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_purge_redundant_kvs_while_flush"
               c_rocksdb_options_set_purge_redundant_kvs_while_flush ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_options_set_allow_mmap_reads"
               c_rocksdb_options_set_allow_mmap_reads ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_options_set_allow_mmap_writes"
               c_rocksdb_options_set_allow_mmap_writes ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_options_set_use_direct_reads"
               c_rocksdb_options_set_use_direct_reads ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_use_direct_io_for_flush_and_compaction"
               c_rocksdb_options_set_use_direct_io_for_flush_and_compaction ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_is_fd_close_on_exec"
               c_rocksdb_options_set_is_fd_close_on_exec ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_skip_log_error_on_recovery"
               c_rocksdb_options_set_skip_log_error_on_recovery ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_stats_dump_period_sec"
               c_rocksdb_options_set_stats_dump_period_sec ::
               Ptr RocksdbOptions -> CUInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_advise_random_on_open"
               c_rocksdb_options_set_advise_random_on_open ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_access_hint_on_compaction_start"
               c_rocksdb_options_set_access_hint_on_compaction_start ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_use_adaptive_mutex"
               c_rocksdb_options_set_use_adaptive_mutex ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_options_set_bytes_per_sync"
               c_rocksdb_options_set_bytes_per_sync ::
               Ptr RocksdbOptions -> Word64 -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_allow_concurrent_memtable_write"
               c_rocksdb_options_set_allow_concurrent_memtable_write ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_enable_write_thread_adaptive_yield"
               c_rocksdb_options_set_enable_write_thread_adaptive_yield ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_max_sequential_skip_in_iterations"
               c_rocksdb_options_set_max_sequential_skip_in_iterations ::
               Ptr RocksdbOptions -> Word64 -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_disable_auto_compactions"
               c_rocksdb_options_set_disable_auto_compactions ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_optimize_filters_for_hits"
               c_rocksdb_options_set_optimize_filters_for_hits ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_delete_obsolete_files_period_micros"
               c_rocksdb_options_set_delete_obsolete_files_period_micros ::
               Ptr RocksdbOptions -> Word64 -> IO ()

foreign import ccall unsafe "rocksdb_options_prepare_for_bulk_load"
               c_rocksdb_options_prepare_for_bulk_load ::
               Ptr RocksdbOptions -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_memtable_vector_rep"
               c_rocksdb_options_set_memtable_vector_rep ::
               Ptr RocksdbOptions -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_memtable_prefix_bloom_size_ratio"
               c_rocksdb_options_set_memtable_prefix_bloom_size_ratio ::
               Ptr RocksdbOptions -> CDouble -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_max_compaction_bytes"
               c_rocksdb_options_set_max_compaction_bytes ::
               Ptr RocksdbOptions -> Word64 -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_hash_skip_list_rep"
               c_rocksdb_options_set_hash_skip_list_rep ::
               Ptr RocksdbOptions -> CSize -> Int32 -> Int32 -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_hash_link_list_rep"
               c_rocksdb_options_set_hash_link_list_rep ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_plain_table_factory"
               c_rocksdb_options_set_plain_table_factory ::
               Ptr RocksdbOptions -> Word32 -> CInt -> CDouble -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_min_level_to_compress"
               c_rocksdb_options_set_min_level_to_compress ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_memtable_huge_page_size"
               c_rocksdb_options_set_memtable_huge_page_size ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_max_successive_merges"
               c_rocksdb_options_set_max_successive_merges ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_options_set_bloom_locality"
               c_rocksdb_options_set_bloom_locality ::
               Ptr RocksdbOptions -> Word32 -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_inplace_update_support"
               c_rocksdb_options_set_inplace_update_support ::
               Ptr RocksdbOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_inplace_update_num_locks"
               c_rocksdb_options_set_inplace_update_num_locks ::
               Ptr RocksdbOptions -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_report_bg_io_stats"
               c_rocksdb_options_set_report_bg_io_stats ::
               Ptr RocksdbOptions -> CInt -> IO ()

c_rocksdb_tolerate_corrupted_tail_records_recovery, c_rocksdb_absolute_consistency_recovery, c_rocksdb_point_in_time_recovery, c_rocksdb_skip_any_corrupted_records_recovery ::
     CInt
c_rocksdb_tolerate_corrupted_tail_records_recovery = 0

c_rocksdb_absolute_consistency_recovery = 1

c_rocksdb_point_in_time_recovery = 2

c_rocksdb_skip_any_corrupted_records_recovery = 3

foreign import ccall unsafe "rocksdb_options_set_wal_recovery_mode"
               c_rocksdb_options_set_wal_recovery_mode ::
               Ptr RocksdbOptions -> CInt -> IO ()

c_rocksdb_no_compression, c_rocksdb_snappy_compression, c_rocksdb_zlib_compression, c_rocksdb_bz2_compression, c_rocksdb_lz4_compression, c_rocksdb_lz4hc_compression, c_rocksdb_xpress_compression, c_rocksdb_zstd_compression ::
     CInt
c_rocksdb_no_compression = 0

c_rocksdb_snappy_compression = 1

c_rocksdb_zlib_compression = 2

c_rocksdb_bz2_compression = 3

c_rocksdb_lz4_compression = 4

c_rocksdb_lz4hc_compression = 5

c_rocksdb_xpress_compression = 6

c_rocksdb_zstd_compression = 7

foreign import ccall unsafe "rocksdb_options_set_compression"
               c_rocksdb_options_set_compression ::
               Ptr RocksdbOptions -> CInt -> IO ()

c_rocksdb_level_compaction, c_rocksdb_universal_compaction, c_rocksdb_fifo_compaction ::
     CInt
c_rocksdb_level_compaction = 0

c_rocksdb_universal_compaction = 1

c_rocksdb_fifo_compaction = 2

foreign import ccall unsafe "rocksdb_options_set_compaction_style"
               c_rocksdb_options_set_compaction_style ::
               Ptr RocksdbOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_universal_compaction_options"
               c_rocksdb_options_set_universal_compaction_options ::
               Ptr RocksdbOptions ->
                 Ptr RocksdbUniversalCompactionOptions -> IO ()

foreign import ccall unsafe
               "rocksdb_options_set_fifo_compaction_options"
               c_rocksdb_options_set_fifo_compaction_options ::
               Ptr RocksdbOptions -> Ptr RocksdbFifoCompactionOptions -> IO ()

foreign import ccall unsafe "rocksdb_options_set_ratelimiter"
               c_rocksdb_options_set_ratelimiter ::
               Ptr RocksdbOptions -> Ptr RocksdbRatelimiter -> IO ()

foreign import ccall unsafe "rocksdb_ratelimiter_create"
               c_rocksdb_ratelimiter_create ::
               Int64 -> Int64 -> Int32 -> IO (Ptr RocksdbRatelimiter)

foreign import ccall unsafe "rocksdb_ratelimiter_destroy"
               c_rocksdb_ratelimiter_destroy :: Ptr RocksdbRatelimiter -> IO ()

foreign import ccall unsafe "rocksdb_compactionfilter_create"
               c_rocksdb_compactionfilter_create ::
               Ptr () ->
                 FunPtr (Ptr () -> IO ()) ->
                   FunPtr
                     (Ptr () ->
                        CInt ->
                          Ptr CChar ->
                            CSize ->
                              Ptr CChar ->
                                CSize -> Ptr (Ptr CChar) -> Ptr CSize -> Ptr CUChar -> IO CUChar)
                     ->
                     FunPtr (Ptr () -> IO (Ptr CChar)) ->
                       IO (Ptr RocksdbCompactionfilter)

foreign import ccall unsafe
               "rocksdb_compactionfilter_set_ignore_snapshots"
               c_rocksdb_compactionfilter_set_ignore_snapshots ::
               Ptr RocksdbCompactionfilter -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_compactionfilter_destroy"
               c_rocksdb_compactionfilter_destroy ::
               Ptr RocksdbCompactionfilter -> IO ()

foreign import ccall unsafe
               "rocksdb_compactionfiltercontext_is_full_compaction"
               c_rocksdb_compactionfiltercontext_is_full_compaction ::
               Ptr RocksdbCompactionfiltercontext -> IO CUChar

foreign import ccall unsafe
               "rocksdb_compactionfiltercontext_is_manual_compaction"
               c_rocksdb_compactionfiltercontext_is_manual_compaction ::
               Ptr RocksdbCompactionfiltercontext -> IO CUChar

foreign import ccall unsafe
               "rocksdb_compactionfilterfactory_create"
               c_rocksdb_compactionfilterfactory_create ::
               Ptr () ->
                 FunPtr (Ptr () -> IO ()) ->
                   FunPtr
                     (Ptr () ->
                        Ptr RocksdbCompactionfiltercontext ->
                          IO (Ptr RocksdbCompactionfilter))
                     ->
                     FunPtr (Ptr () -> IO (Ptr CChar)) ->
                       IO (Ptr RocksdbCompactionfilterfactory)

foreign import ccall unsafe
               "rocksdb_compactionfilterfactory_destroy"
               c_rocksdb_compactionfilterfactory_destroy ::
               Ptr RocksdbCompactionfilterfactory -> IO ()

foreign import ccall unsafe "rocksdb_comparator_create"
               c_rocksdb_comparator_create ::
               Ptr () ->
                 FunPtr (Ptr () -> IO ()) ->
                   FunPtr
                     (Ptr () -> Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO CInt)
                     -> FunPtr (Ptr () -> IO (Ptr CChar)) -> IO (Ptr RocksdbComparator)

foreign import ccall unsafe "rocksdb_comparator_destroy"
               c_rocksdb_comparator_destroy :: Ptr RocksdbComparator -> IO ()

foreign import ccall unsafe "rocksdb_filterpolicy_create"
               c_rocksdb_filterpolicy_create ::
               Ptr () ->
                 FunPtr (Ptr () -> IO ()) ->
                   FunPtr
                     (Ptr () ->
                        Ptr (Ptr CChar) ->
                          Ptr CSize -> CInt -> Ptr CSize -> IO (Ptr CChar))
                     ->
                     FunPtr
                       (Ptr () -> Ptr CChar -> CSize -> Ptr CChar -> CSize -> IO CUChar)
                       ->
                       FunPtr (Ptr () -> Ptr CChar -> CSize -> IO ()) ->
                         FunPtr (Ptr () -> IO CChar) -> IO (Ptr RocksdbFilterpolicy)

foreign import ccall unsafe "rocksdb_filterpolicy_destroy"
               c_rocksdb_filterpolicy_destroy :: Ptr RocksdbFilterpolicy -> IO ()

foreign import ccall unsafe "rocksdb_filterpolicy_create_bloom"
               c_rocksdb_filterpolicy_create_bloom ::
               CInt -> IO (Ptr RocksdbFilterpolicy)

foreign import ccall unsafe
               "rocksdb_filterpolicy_create_bloom_full"
               c_rocksdb_filterpolicy_create_bloom_full ::
               CInt -> IO (Ptr RocksdbFilterpolicy)

foreign import ccall unsafe "rocksdb_mergeoperator_create"
               c_rocksdb_mergeoperator_create ::
               Ptr () ->
                 FunPtr (Ptr () -> IO ()) ->
                   FunPtr
                     (Ptr () ->
                        Ptr CChar ->
                          CSize ->
                            Ptr CChar ->
                              CSize ->
                                Ptr (Ptr CChar) ->
                                  Ptr CSize -> CInt -> Ptr CUChar -> Ptr CSize -> IO (Ptr CChar))
                     ->
                     FunPtr
                       (Ptr () ->
                          Ptr CChar ->
                            CSize ->
                              Ptr (Ptr CChar) ->
                                Ptr CSize -> CInt -> Ptr CUChar -> Ptr CSize -> IO (Ptr CChar))
                       ->
                       FunPtr (Ptr () -> Ptr CChar -> CSize -> IO ()) ->
                         FunPtr (Ptr () -> IO (Ptr CChar)) -> IO (Ptr RocksdbMergeoperator)

foreign import ccall unsafe "rocksdb_mergeoperator_destroy"
               c_rocksdb_mergeoperator_destroy ::
               Ptr RocksdbMergeoperator -> IO ()

foreign import ccall unsafe "rocksdb_readoptions_create"
               c_rocksdb_readoptions_create :: IO (Ptr RocksdbReadoptions)

foreign import ccall unsafe "rocksdb_readoptions_destroy"
               c_rocksdb_readoptions_destroy :: Ptr RocksdbReadoptions -> IO ()

foreign import ccall unsafe
               "rocksdb_readoptions_set_verify_checksums"
               c_rocksdb_readoptions_set_verify_checksums ::
               Ptr RocksdbReadoptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_readoptions_set_fill_cache"
               c_rocksdb_readoptions_set_fill_cache ::
               Ptr RocksdbReadoptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_readoptions_set_snapshot"
               c_rocksdb_readoptions_set_snapshot ::
               Ptr RocksdbReadoptions -> Ptr RocksdbSnapshot -> IO ()

foreign import ccall unsafe
               "rocksdb_readoptions_set_iterate_upper_bound"
               c_rocksdb_readoptions_set_iterate_upper_bound ::
               Ptr RocksdbReadoptions -> Ptr CChar -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_readoptions_set_read_tier"
               c_rocksdb_readoptions_set_read_tier ::
               Ptr RocksdbReadoptions -> CInt -> IO ()

foreign import ccall unsafe "rocksdb_readoptions_set_tailing"
               c_rocksdb_readoptions_set_tailing ::
               Ptr RocksdbReadoptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_readoptions_set_readahead_size"
               c_rocksdb_readoptions_set_readahead_size ::
               Ptr RocksdbReadoptions -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_readoptions_set_pin_data"
               c_rocksdb_readoptions_set_pin_data ::
               Ptr RocksdbReadoptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_readoptions_set_total_order_seek"
               c_rocksdb_readoptions_set_total_order_seek ::
               Ptr RocksdbReadoptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_writeoptions_create"
               c_rocksdb_writeoptions_create :: IO (Ptr RocksdbWriteoptions)

foreign import ccall unsafe "rocksdb_writeoptions_destroy"
               c_rocksdb_writeoptions_destroy :: Ptr RocksdbWriteoptions -> IO ()

foreign import ccall unsafe "rocksdb_writeoptions_set_sync"
               c_rocksdb_writeoptions_set_sync ::
               Ptr RocksdbWriteoptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_writeoptions_disable_WAL"
               c_rocksdb_writeoptions_disable_WAL ::
               Ptr RocksdbWriteoptions -> CInt -> IO ()

foreign import ccall unsafe "rocksdb_compactoptions_create"
               c_rocksdb_compactoptions_create :: IO (Ptr RocksdbCompactoptions)

foreign import ccall unsafe "rocksdb_compactoptions_destroy"
               c_rocksdb_compactoptions_destroy ::
               Ptr RocksdbCompactoptions -> IO ()

foreign import ccall unsafe
               "rocksdb_compactoptions_set_exclusive_manual_compaction"
               c_rocksdb_compactoptions_set_exclusive_manual_compaction ::
               Ptr RocksdbCompactoptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_compactoptions_set_change_level"
               c_rocksdb_compactoptions_set_change_level ::
               Ptr RocksdbCompactoptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_compactoptions_set_target_level"
               c_rocksdb_compactoptions_set_target_level ::
               Ptr RocksdbCompactoptions -> CInt -> IO ()

foreign import ccall unsafe "rocksdb_flushoptions_create"
               c_rocksdb_flushoptions_create :: IO (Ptr RocksdbFlushoptions)

foreign import ccall unsafe "rocksdb_flushoptions_destroy"
               c_rocksdb_flushoptions_destroy :: Ptr RocksdbFlushoptions -> IO ()

foreign import ccall unsafe "rocksdb_flushoptions_set_wait"
               c_rocksdb_flushoptions_set_wait ::
               Ptr RocksdbFlushoptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_cache_create_lru"
               c_rocksdb_cache_create_lru :: CSize -> IO (Ptr RocksdbCache)

foreign import ccall unsafe "rocksdb_cache_destroy"
               c_rocksdb_cache_destroy :: Ptr RocksdbCache -> IO ()

foreign import ccall unsafe "rocksdb_cache_set_capacity"
               c_rocksdb_cache_set_capacity :: Ptr RocksdbCache -> CSize -> IO ()

foreign import ccall unsafe "rocksdb_cache_get_usage"
               c_rocksdb_cache_get_usage :: Ptr RocksdbCache -> IO CSize

foreign import ccall unsafe "rocksdb_cache_get_pinned_usage"
               c_rocksdb_cache_get_pinned_usage :: Ptr RocksdbCache -> IO CSize

foreign import ccall unsafe "rocksdb_dbpath_create"
               c_rocksdb_dbpath_create ::
               Ptr CChar -> Word64 -> IO (Ptr RocksdbDbpath)

foreign import ccall unsafe "rocksdb_dbpath_destroy"
               c_rocksdb_dbpath_destroy :: Ptr RocksdbDbpath -> IO ()

foreign import ccall unsafe "rocksdb_create_default_env"
               c_rocksdb_create_default_env :: IO (Ptr RocksdbEnv)

foreign import ccall unsafe "rocksdb_create_mem_env"
               c_rocksdb_create_mem_env :: IO (Ptr RocksdbEnv)

foreign import ccall unsafe "rocksdb_env_set_background_threads"
               c_rocksdb_env_set_background_threads ::
               Ptr RocksdbEnv -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_env_set_high_priority_background_threads"
               c_rocksdb_env_set_high_priority_background_threads ::
               Ptr RocksdbEnv -> CInt -> IO ()

foreign import ccall unsafe "rocksdb_env_join_all_threads"
               c_rocksdb_env_join_all_threads :: Ptr RocksdbEnv -> IO ()

foreign import ccall unsafe "rocksdb_env_destroy"
               c_rocksdb_env_destroy :: Ptr RocksdbEnv -> IO ()

foreign import ccall unsafe "rocksdb_envoptions_create"
               c_rocksdb_envoptions_create :: IO (Ptr RocksdbEnvoptions)

foreign import ccall unsafe "rocksdb_envoptions_destroy"
               c_rocksdb_envoptions_destroy :: Ptr RocksdbEnvoptions -> IO ()

foreign import ccall unsafe "rocksdb_sstfilewriter_create"
               c_rocksdb_sstfilewriter_create ::
               Ptr RocksdbEnvoptions ->
                 Ptr RocksdbOptions -> IO (Ptr RocksdbSstfilewriter)

foreign import ccall unsafe
               "rocksdb_sstfilewriter_create_with_comparator"
               c_rocksdb_sstfilewriter_create_with_comparator ::
               Ptr RocksdbEnvoptions ->
                 Ptr RocksdbOptions ->
                   Ptr RocksdbComparator -> IO (Ptr RocksdbSstfilewriter)

foreign import ccall unsafe "rocksdb_sstfilewriter_open"
               c_rocksdb_sstfilewriter_open ::
               Ptr RocksdbSstfilewriter -> Ptr CChar -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_sstfilewriter_add"
               c_rocksdb_sstfilewriter_add ::
               Ptr RocksdbSstfilewriter ->
                 Ptr CChar ->
                   CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_sstfilewriter_put"
               c_rocksdb_sstfilewriter_put ::
               Ptr RocksdbSstfilewriter ->
                 Ptr CChar ->
                   CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_sstfilewriter_merge"
               c_rocksdb_sstfilewriter_merge ::
               Ptr RocksdbSstfilewriter ->
                 Ptr CChar ->
                   CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_sstfilewriter_delete"
               c_rocksdb_sstfilewriter_delete ::
               Ptr RocksdbSstfilewriter ->
                 Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_sstfilewriter_finish"
               c_rocksdb_sstfilewriter_finish ::
               Ptr RocksdbSstfilewriter -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_sstfilewriter_destroy"
               c_rocksdb_sstfilewriter_destroy ::
               Ptr RocksdbSstfilewriter -> IO ()

foreign import ccall unsafe
               "rocksdb_ingestexternalfileoptions_create"
               c_rocksdb_ingestexternalfileoptions_create ::
               IO (Ptr RocksdbIngestexternalfileoptions)

foreign import ccall unsafe
               "rocksdb_ingestexternalfileoptions_set_move_files"
               c_rocksdb_ingestexternalfileoptions_set_move_files ::
               Ptr RocksdbIngestexternalfileoptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_ingestexternalfileoptions_set_snapshot_consistency"
               c_rocksdb_ingestexternalfileoptions_set_snapshot_consistency ::
               Ptr RocksdbIngestexternalfileoptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_ingestexternalfileoptions_set_allow_global_seqno"
               c_rocksdb_ingestexternalfileoptions_set_allow_global_seqno ::
               Ptr RocksdbIngestexternalfileoptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_ingestexternalfileoptions_set_allow_blocking_flush"
               c_rocksdb_ingestexternalfileoptions_set_allow_blocking_flush ::
               Ptr RocksdbIngestexternalfileoptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_ingestexternalfileoptions_destroy"
               c_rocksdb_ingestexternalfileoptions_destroy ::
               Ptr RocksdbIngestexternalfileoptions -> IO ()

foreign import ccall unsafe "rocksdb_ingest_external_file"
               c_rocksdb_ingest_external_file ::
               Ptr Rocksdb ->
                 Ptr (Ptr CChar) ->
                   CSize ->
                     Ptr RocksdbIngestexternalfileoptions -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_ingest_external_file_cf"
               c_rocksdb_ingest_external_file_cf ::
               Ptr Rocksdb ->
                 Ptr RocksdbColumnFamilyHandle ->
                   Ptr (Ptr CChar) ->
                     CSize ->
                       Ptr RocksdbIngestexternalfileoptions -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_slicetransform_create"
               c_rocksdb_slicetransform_create ::
               Ptr () ->
                 FunPtr (Ptr () -> IO ()) ->
                   FunPtr
                     (Ptr () -> Ptr CChar -> CSize -> Ptr CSize -> IO (Ptr CChar))
                     ->
                     FunPtr (Ptr () -> Ptr CChar -> CSize -> IO CUChar) ->
                       FunPtr (Ptr () -> Ptr CChar -> CSize -> IO CUChar) ->
                         FunPtr (Ptr () -> IO (Ptr CChar)) -> IO (Ptr RocksdbSlicetransform)

foreign import ccall unsafe
               "rocksdb_slicetransform_create_fixed_prefix"
               c_rocksdb_slicetransform_create_fixed_prefix ::
               CSize -> IO (Ptr RocksdbSlicetransform)

foreign import ccall unsafe "rocksdb_slicetransform_create_noop"
               c_rocksdb_slicetransform_create_noop ::
               IO (Ptr RocksdbSlicetransform)

foreign import ccall unsafe "rocksdb_slicetransform_destroy"
               c_rocksdb_slicetransform_destroy ::
               Ptr RocksdbSlicetransform -> IO ()

c_rocksdb_similar_size_compaction_stop_style, c_rocksdb_total_size_compaction_stop_style ::
     CInt
c_rocksdb_similar_size_compaction_stop_style = 0

c_rocksdb_total_size_compaction_stop_style = 1

foreign import ccall unsafe
               "rocksdb_universal_compaction_options_create"
               c_rocksdb_universal_compaction_options_create ::
               IO (Ptr RocksdbUniversalCompactionOptions)

foreign import ccall unsafe
               "rocksdb_universal_compaction_options_set_size_ratio"
               c_rocksdb_universal_compaction_options_set_size_ratio ::
               Ptr RocksdbUniversalCompactionOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_universal_compaction_options_set_min_merge_width"
               c_rocksdb_universal_compaction_options_set_min_merge_width ::
               Ptr RocksdbUniversalCompactionOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_universal_compaction_options_set_max_merge_width"
               c_rocksdb_universal_compaction_options_set_max_merge_width ::
               Ptr RocksdbUniversalCompactionOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_universal_compaction_options_set_max_size_amplification_percent"
               c_rocksdb_universal_compaction_options_set_max_size_amplification_percent
               :: Ptr RocksdbUniversalCompactionOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_universal_compaction_options_set_compression_size_percent"
               c_rocksdb_universal_compaction_options_set_compression_size_percent
               :: Ptr RocksdbUniversalCompactionOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_universal_compaction_options_set_stop_style"
               c_rocksdb_universal_compaction_options_set_stop_style ::
               Ptr RocksdbUniversalCompactionOptions -> CInt -> IO ()

foreign import ccall unsafe
               "rocksdb_universal_compaction_options_destroy"
               c_rocksdb_universal_compaction_options_destroy ::
               Ptr RocksdbUniversalCompactionOptions -> IO ()

foreign import ccall unsafe
               "rocksdb_fifo_compaction_options_create"
               c_rocksdb_fifo_compaction_options_create ::
               IO (Ptr RocksdbFifoCompactionOptions)

foreign import ccall unsafe
               "rocksdb_fifo_compaction_options_set_max_table_files_size"
               c_rocksdb_fifo_compaction_options_set_max_table_files_size ::
               Ptr RocksdbFifoCompactionOptions -> Word64 -> IO ()

foreign import ccall unsafe
               "rocksdb_fifo_compaction_options_destroy"
               c_rocksdb_fifo_compaction_options_destroy ::
               Ptr RocksdbFifoCompactionOptions -> IO ()

foreign import ccall unsafe "rocksdb_livefiles_count"
               c_rocksdb_livefiles_count :: Ptr RocksdbLivefiles -> IO CInt

foreign import ccall unsafe "rocksdb_livefiles_name"
               c_rocksdb_livefiles_name ::
               Ptr RocksdbLivefiles -> CInt -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_livefiles_level"
               c_rocksdb_livefiles_level ::
               Ptr RocksdbLivefiles -> CInt -> IO CInt

foreign import ccall unsafe "rocksdb_livefiles_size"
               c_rocksdb_livefiles_size ::
               Ptr RocksdbLivefiles -> CInt -> IO CSize

foreign import ccall unsafe "rocksdb_livefiles_smallestkey"
               c_rocksdb_livefiles_smallestkey ::
               Ptr RocksdbLivefiles -> CInt -> Ptr CSize -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_livefiles_largestkey"
               c_rocksdb_livefiles_largestkey ::
               Ptr RocksdbLivefiles -> CInt -> Ptr CSize -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_livefiles_destroy"
               c_rocksdb_livefiles_destroy :: Ptr RocksdbLivefiles -> IO ()

foreign import ccall unsafe "rocksdb_get_options_from_string"
               c_rocksdb_get_options_from_string ::
               Ptr RocksdbOptions ->
                 Ptr CChar -> Ptr RocksdbOptions -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_delete_file_in_range"
               c_rocksdb_delete_file_in_range ::
               Ptr Rocksdb ->
                 Ptr CChar ->
                   CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_delete_file_in_range_cf"
               c_rocksdb_delete_file_in_range_cf ::
               Ptr Rocksdb ->
                 Ptr RocksdbColumnFamilyHandle ->
                   Ptr CChar ->
                     CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe
               "rocksdb_transactiondb_create_column_family"
               c_rocksdb_transactiondb_create_column_family ::
               Ptr RocksdbTransactiondb ->
                 Ptr RocksdbOptions ->
                   Ptr CChar -> Ptr (Ptr CChar) -> IO (Ptr RocksdbColumnFamilyHandle)

foreign import ccall unsafe "rocksdb_transactiondb_open"
               c_rocksdb_transactiondb_open ::
               Ptr RocksdbOptions ->
                 Ptr RocksdbTransactiondbOptions ->
                   Ptr CChar -> Ptr (Ptr CChar) -> IO (Ptr RocksdbTransactiondb)

foreign import ccall unsafe "rocksdb_transactiondb_create_snapshot"
               c_rocksdb_transactiondb_create_snapshot ::
               Ptr RocksdbTransactiondb -> IO (Ptr RocksdbSnapshot)

foreign import ccall unsafe
               "rocksdb_transactiondb_release_snapshot"
               c_rocksdb_transactiondb_release_snapshot ::
               Ptr RocksdbTransactiondb -> Ptr RocksdbSnapshot -> IO ()

foreign import ccall unsafe "rocksdb_transaction_begin"
               c_rocksdb_transaction_begin ::
               Ptr RocksdbTransactiondb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr RocksdbTransactionOptions ->
                     Ptr RocksdbTransaction -> IO (Ptr RocksdbTransaction)

foreign import ccall unsafe "rocksdb_transaction_commit"
               c_rocksdb_transaction_commit ::
               Ptr RocksdbTransaction -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_transaction_rollback"
               c_rocksdb_transaction_rollback ::
               Ptr RocksdbTransaction -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_transaction_destroy"
               c_rocksdb_transaction_destroy :: Ptr RocksdbTransaction -> IO ()

foreign import ccall unsafe "rocksdb_transaction_get_snapshot"
               c_rocksdb_transaction_get_snapshot ::
               Ptr RocksdbTransaction -> IO (Ptr RocksdbSnapshot)

foreign import ccall unsafe "rocksdb_transaction_get"
               c_rocksdb_transaction_get ::
               Ptr RocksdbTransaction ->
                 Ptr RocksdbReadoptions ->
                   Ptr CChar ->
                     CSize -> Ptr CSize -> Ptr (Ptr CChar) -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_transaction_get_cf"
               c_rocksdb_transaction_get_cf ::
               Ptr RocksdbTransaction ->
                 Ptr RocksdbReadoptions ->
                   Ptr RocksdbColumnFamilyHandle ->
                     Ptr CChar ->
                       CSize -> Ptr CSize -> Ptr (Ptr CChar) -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_transaction_get_for_update"
               c_rocksdb_transaction_get_for_update ::
               Ptr RocksdbTransaction ->
                 Ptr RocksdbReadoptions ->
                   Ptr CChar ->
                     CSize -> Ptr CSize -> CUChar -> Ptr (Ptr CChar) -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_transactiondb_get"
               c_rocksdb_transactiondb_get ::
               Ptr RocksdbTransactiondb ->
                 Ptr RocksdbReadoptions ->
                   Ptr CChar ->
                     CSize -> Ptr CSize -> Ptr (Ptr CChar) -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_transactiondb_get_cf"
               c_rocksdb_transactiondb_get_cf ::
               Ptr RocksdbTransactiondb ->
                 Ptr RocksdbReadoptions ->
                   Ptr RocksdbColumnFamilyHandle ->
                     Ptr CChar ->
                       CSize -> Ptr CSize -> Ptr (Ptr CChar) -> IO (Ptr CChar)

foreign import ccall unsafe "rocksdb_transaction_put"
               c_rocksdb_transaction_put ::
               Ptr RocksdbTransaction ->
                 Ptr CChar ->
                   CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_transaction_put_cf"
               c_rocksdb_transaction_put_cf ::
               Ptr RocksdbTransaction ->
                 Ptr RocksdbColumnFamilyHandle ->
                   Ptr CChar ->
                     CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_transactiondb_put"
               c_rocksdb_transactiondb_put ::
               Ptr RocksdbTransactiondb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr CChar ->
                     CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_transactiondb_put_cf"
               c_rocksdb_transactiondb_put_cf ::
               Ptr RocksdbTransactiondb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr RocksdbColumnFamilyHandle ->
                     Ptr CChar ->
                       CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_transactiondb_write"
               c_rocksdb_transactiondb_write ::
               Ptr RocksdbTransactiondb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr RocksdbWritebatch -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_transaction_merge"
               c_rocksdb_transaction_merge ::
               Ptr RocksdbTransaction ->
                 Ptr CChar ->
                   CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_transactiondb_merge"
               c_rocksdb_transactiondb_merge ::
               Ptr RocksdbTransactiondb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr CChar ->
                     CSize -> Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_transaction_delete"
               c_rocksdb_transaction_delete ::
               Ptr RocksdbTransaction ->
                 Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_transaction_delete_cf"
               c_rocksdb_transaction_delete_cf ::
               Ptr RocksdbTransaction ->
                 Ptr RocksdbColumnFamilyHandle ->
                   Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_transactiondb_delete"
               c_rocksdb_transactiondb_delete ::
               Ptr RocksdbTransactiondb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_transactiondb_delete_cf"
               c_rocksdb_transactiondb_delete_cf ::
               Ptr RocksdbTransactiondb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr RocksdbColumnFamilyHandle ->
                     Ptr CChar -> CSize -> Ptr (Ptr CChar) -> IO ()

foreign import ccall unsafe "rocksdb_transaction_create_iterator"
               c_rocksdb_transaction_create_iterator ::
               Ptr RocksdbTransaction ->
                 Ptr RocksdbReadoptions -> IO (Ptr RocksdbIterator)

foreign import ccall unsafe "rocksdb_transactiondb_create_iterator"
               c_rocksdb_transactiondb_create_iterator ::
               Ptr RocksdbTransactiondb ->
                 Ptr RocksdbReadoptions -> IO (Ptr RocksdbIterator)

foreign import ccall unsafe "rocksdb_transactiondb_close"
               c_rocksdb_transactiondb_close :: Ptr RocksdbTransactiondb -> IO ()

foreign import ccall unsafe
               "rocksdb_transactiondb_checkpoint_object_create"
               c_rocksdb_transactiondb_checkpoint_object_create ::
               Ptr RocksdbTransactiondb ->
                 Ptr (Ptr CChar) -> IO (Ptr RocksdbCheckpoint)

foreign import ccall unsafe "rocksdb_optimistictransactiondb_open"
               c_rocksdb_optimistictransactiondb_open ::
               Ptr RocksdbOptions ->
                 Ptr CChar ->
                   Ptr (Ptr CChar) -> IO (Ptr RocksdbOptimistictransactiondb)

foreign import ccall unsafe "rocksdb_optimistictransaction_begin"
               c_rocksdb_optimistictransaction_begin ::
               Ptr RocksdbOptimistictransactiondb ->
                 Ptr RocksdbWriteoptions ->
                   Ptr RocksdbOptimistictransactionOptions ->
                     Ptr RocksdbTransaction -> IO (Ptr RocksdbTransaction)

foreign import ccall unsafe "rocksdb_optimistictransactiondb_close"
               c_rocksdb_optimistictransactiondb_close ::
               Ptr RocksdbOptimistictransactiondb -> IO ()

foreign import ccall unsafe "rocksdb_transactiondb_options_create"
               c_rocksdb_transactiondb_options_create ::
               IO (Ptr RocksdbTransactiondbOptions)

foreign import ccall unsafe "rocksdb_transactiondb_options_destroy"
               c_rocksdb_transactiondb_options_destroy ::
               Ptr RocksdbTransactiondbOptions -> IO ()

foreign import ccall unsafe
               "rocksdb_transactiondb_options_set_max_num_locks"
               c_rocksdb_transactiondb_options_set_max_num_locks ::
               Ptr RocksdbTransactiondbOptions -> Int64 -> IO ()

foreign import ccall unsafe
               "rocksdb_transactiondb_options_set_num_stripes"
               c_rocksdb_transactiondb_options_set_num_stripes ::
               Ptr RocksdbTransactiondbOptions -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_transactiondb_options_set_transaction_lock_timeout"
               c_rocksdb_transactiondb_options_set_transaction_lock_timeout ::
               Ptr RocksdbTransactiondbOptions -> Int64 -> IO ()

foreign import ccall unsafe
               "rocksdb_transactiondb_options_set_default_lock_timeout"
               c_rocksdb_transactiondb_options_set_default_lock_timeout ::
               Ptr RocksdbTransactiondbOptions -> Int64 -> IO ()

foreign import ccall unsafe "rocksdb_transaction_options_create"
               c_rocksdb_transaction_options_create ::
               IO (Ptr RocksdbTransactionOptions)

foreign import ccall unsafe "rocksdb_transaction_options_destroy"
               c_rocksdb_transaction_options_destroy ::
               Ptr RocksdbTransactionOptions -> IO ()

foreign import ccall unsafe
               "rocksdb_transaction_options_set_set_snapshot"
               c_rocksdb_transaction_options_set_set_snapshot ::
               Ptr RocksdbTransactionOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_transaction_options_set_deadlock_detect"
               c_rocksdb_transaction_options_set_deadlock_detect ::
               Ptr RocksdbTransactionOptions -> CUChar -> IO ()

foreign import ccall unsafe
               "rocksdb_transaction_options_set_lock_timeout"
               c_rocksdb_transaction_options_set_lock_timeout ::
               Ptr RocksdbTransactionOptions -> Int64 -> IO ()

foreign import ccall unsafe
               "rocksdb_transaction_options_set_expiration"
               c_rocksdb_transaction_options_set_expiration ::
               Ptr RocksdbTransactionOptions -> Int64 -> IO ()

foreign import ccall unsafe
               "rocksdb_transaction_options_set_deadlock_detect_depth"
               c_rocksdb_transaction_options_set_deadlock_detect_depth ::
               Ptr RocksdbTransactionOptions -> Int64 -> IO ()

foreign import ccall unsafe
               "rocksdb_transaction_options_set_max_write_batch_size"
               c_rocksdb_transaction_options_set_max_write_batch_size ::
               Ptr RocksdbTransactionOptions -> CSize -> IO ()

foreign import ccall unsafe
               "rocksdb_optimistictransaction_options_create"
               c_rocksdb_optimistictransaction_options_create ::
               IO (Ptr RocksdbOptimistictransactionOptions)

foreign import ccall unsafe
               "rocksdb_optimistictransaction_options_destroy"
               c_rocksdb_optimistictransaction_options_destroy ::
               Ptr RocksdbOptimistictransactionOptions -> IO ()

foreign import ccall unsafe
               "rocksdb_optimistictransaction_options_set_set_snapshot"
               c_rocksdb_optimistictransaction_options_set_set_snapshot ::
               Ptr RocksdbOptimistictransactionOptions -> CUChar -> IO ()

foreign import ccall unsafe "rocksdb_free" c_rocksdb_free ::
               Ptr () -> IO ()

foreign import ccall unsafe "rocksdb_get_pinned"
               c_rocksdb_get_pinned ::
               Ptr Rocksdb ->
                 Ptr RocksdbReadoptions ->
                   Ptr CChar ->
                     CSize -> Ptr (Ptr CChar) -> IO (Ptr RocksdbPinnableslice)

foreign import ccall unsafe "rocksdb_get_pinned_cf"
               c_rocksdb_get_pinned_cf ::
               Ptr Rocksdb ->
                 Ptr RocksdbReadoptions ->
                   Ptr RocksdbColumnFamilyHandle ->
                     Ptr CChar ->
                       CSize -> Ptr (Ptr CChar) -> IO (Ptr RocksdbPinnableslice)

foreign import ccall unsafe "rocksdb_pinnableslice_destroy"
               c_rocksdb_pinnableslice_destroy ::
               Ptr RocksdbPinnableslice -> IO ()

foreign import ccall unsafe "rocksdb_pinnableslice_value"
               c_rocksdb_pinnableslice_value ::
               Ptr RocksdbPinnableslice -> Ptr CSize -> IO (Ptr CChar)
