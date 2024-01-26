module Problem1 where

import Control.Applicative
import Control.Monad
import System.IO

main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    ns_temp <- getContents
    let ns = map (read::String->Int) $ words ns_temp
    let answers = map sumOf35multiples ns
    mapM (putStrLn . show) $ answers

--Task: sum of all multiples of 3 or 5 up to n (exclusive)
--Method: sum multiples of 3, 5; subtract double-counted multiples of 15
sumOf35multiples :: Integral a =>  a -> a
sumOf35multiples x = subtract bothsum $ ((+) (sumOfPattern 5 x) (sumOfPattern 3 x) )
 where bothsum = sumOfPattern 15 x

-- sum of multiples of s up to x (exclusive)
sumOfPattern :: Integral a => a -> a -> a
sumOfPattern s x 
 |even numInts = (1+numInts) * (div numInts 2) * s
 |otherwise = numInts * ((+) (div ((subtract 1) numInts ) 2) 1) * s 
 where 
  numInts = div (subtract 1 x) s
