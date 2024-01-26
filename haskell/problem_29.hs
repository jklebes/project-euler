import Control.Applicative
import Control.Monad
import System.IO
import Data.Set

main = do
    let range = 5
    putStrLn . show $ size $ fromList $ [a^b | a<-[2..range], b<-[2..range]]
