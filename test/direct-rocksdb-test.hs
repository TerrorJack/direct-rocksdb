import Control.Exception.Safe
import Database.RocksDB.DB
import Database.RocksDB.Options
import Foreign
import System.Directory
import System.FilePath

main :: IO ()
main = do
  tmp_dir <- getTemporaryDirectory
  let opts = defaultOptions {createIfMissing = Just True}
      db_path = tmp_dir </> "direct-rocksdb-test.rocksdb"
  bracket (openDB opts db_path) finalizeForeignPtr print
