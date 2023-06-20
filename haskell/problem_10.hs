import Control.Applicative
import Control.Monad
import System.IO

main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    ns_temp <- getContents
    let ns = map (read::String->Int) $ words ns_temp
    let answers = map (\y -> sum (takeWhile (<=y) primes)) ns
    mapM (putStrLn . show) $ answers
                        
primes :: [Int]
primes = 2: [x | x <- [3..], isprime x]
isprime x = all (\p -> x `mod` p >0) (listUpToSqrt x)
    where
        listUpToSqrt x = takeWhile (\p -> p*p <= x) primes