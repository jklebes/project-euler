import Control.Applicative
import Control.Monad
import System.IO
import Prelude 
import Data.Char

main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    ns_temp <- getContents
    let ns = map (read::String->Int) $ words ns_temp
    let answers = map f ns
    mapM (putStrLn . show) $ answers
  
f :: Int -> Int  
f a = sumStr $ show $ twoToN a 
    where twoToN n = 2^n

sumStr :: [Char] -> Int
sumStr as = sum $ map digitToInt as
