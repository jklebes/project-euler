import Control.Applicative
import Control.Monad
import System.IO
import Data.Char (digitToInt)

main = do
    let power = 4
    let upperLimit = 354294 -- 6*9^5, highest possible eligible 6 digit number 	                            -- 7 digit numbers and more are not reachable
    let pows = [i^power | i<-[1..9]] --memoize powers of digits
    let answer = powsum pows upperLimit
    putStrLn . show $ answer

digits :: Int -> [Int]
digits n = map digitToInt $ show n

digitSum :: [Int] -> Int -> Int
digitSum pows n = sum([pows !! (subtract 1 i) | i <- digits n, i /= 0])

powsum :: [Int] -> Int -> Int
powsum pows limit = sum $ filter (\ i -> i == (digitSum pows i)) $ [2..limit]
