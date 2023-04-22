import Control.Applicative
import Control.Monad
import System.IO

-- Template for IO for hackerrank problems where input is of the form
-- N
-- i1
-- i2
-- ...
-- iN

main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    ns_temp <- getContents
    let ns = map (read::String->Int) $ words ns_temp
    let answers = map f ns
    mapM (putStrLn . show) $ answers
    
-- your problem-solving function int -> int here
f :: Integral a => a -> a
f a = a
