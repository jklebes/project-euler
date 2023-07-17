import Control.Applicative
import Control.Monad
import System.IO
import Data.List

main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    ns_temp <- getContents
    let ns = map (read::String->Int) $ words ns_temp
    let answers = map abundantSum ns
    mapM (putStrLn) $ answers

abundantSum ::  Int -> [Char]
abundantSum x
    | x<24 = "NO"
    | x>20161 = "YES"
    | otherwise = if elem x $ sumList x then "YES" else "NO"
    
sumList x = [n+m | n <- abundant, m <- dropWhile (<n) $ takeWhile (<= (x-n)) $ abundant] 
    where abundant = [ i | i <- [12..x], factorSum i > i]

factorSum n = (+) 1 $ (\ x -> (-) x sqrt_ ) $ sum $ [i+(div n i) | i<-[2.. (floor $ sqrt $ fromIntegral n)] , mod n i == 0] 
    where sqrt_ = if (sqrt__^2 == n) then sqrt__ else 0
          sqrt__ = floor $ sqrt $ fromIntegral n 

