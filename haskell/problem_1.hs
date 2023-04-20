import Control.Applicative
import Control.Monad
import System.IO

main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    ns_temp <- getContents
    let ns = map (read::String->Int) $ words ns_temp
    let answers = map ( sumOf35multiples . (subtract 1)) ns
    mapM (putStrLn . show) $ answers

sumOf35multiples :: Integral a =>  a -> a
sumOf35multiples x = subtract bothsum $ ((+) (sumOfPatternEuler 5 x) (sumOfPatternEuler 3 x) )
 where bothsum = sumOfPatternEuler 15 x

--this avoids saving the whole list of numbers before summing
sumOfPattern :: Integral a => a -> a -> a
sumOfPattern s x
 | x < s = 0 -- 0 if we start below s
 | x == s = s --base if we land on s
 | mod x s == 0 = x + (sumOfPattern s (subtract s x)) --if at multiple of s: add the number
 | otherwise = sumOfPattern s (x-1)  --descnd until we find multiple of s to start at

--the smarter way
sumOfPatternEuler :: Integral a => a -> a -> a
sumOfPatternEuler s x 
 |even numInts = (1+numInts) * (div numInts 2) * s
 |otherwise = (+) (numInts * (div ((subtract 1) numInts ) 2) * s ) (s*numInts)
 where 
  numInts = div x s