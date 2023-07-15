import Control.Applicative
import Control.Monad
import System.IO
import Data.List 

main :: IO [()] 
main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    ns_temp <- getContents
    let ns = map (read::String->Int) $ words ns_temp
    let answers = map ans ns
    mapM (putStrLn . show) $ answers
                         
                 
ans :: Int -> Int
ans n = case find (\x -> numFactors x > n) triangles of
    Just y -> y  --unwrap the Maybe Int returned by Data.List find 
    Nothing -> -1

triangles :: [Int]
triangles = scanl (+) 0 [1..]
                      
numFactors :: Int -> Int
numFactors 1= 1
numFactors n = product $ map (\ x -> numDivides n x) $ takeWhile ( <= n) primes
                                                           
primes :: [Int]
-- only primes up to 41 needed for queries up to 1000 (max answer 842161320, with largest prime factor 41)
primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]

numDivides :: Int -> Int -> Int
numDivides 0 _ = 0
numDivides n x 
    | mod n x == 0 = (+) 1 $ numDivides (div n x) x
    | otherwise = 1
