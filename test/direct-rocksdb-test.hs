import Control.Exception
import Database.RocksDB.Internals

main :: IO ()
main = bracket c_rocksdb_options_create c_rocksdb_options_destroy print
