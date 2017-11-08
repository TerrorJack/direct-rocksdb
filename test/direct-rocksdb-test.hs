import Control.Exception.Safe
import Data.Default.Class
import Data.Proxy
import Database.RocksDB.Marshal
import Database.RocksDB.Options

main :: IO ()
main =
  bracket (marshal (def :: Options)) (finalize (Proxy :: Proxy Options)) print
