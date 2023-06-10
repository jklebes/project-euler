import Control.Applicative
import Control.Monad
import System.IO

main :: IO [()] 
main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    ns_temp <- getContents
    let ns = map (read::String->Int) $ words ns_temp
    let answers = map ans ns
    mapM (putStrLn . show) $ answers

-- find first triangle number with over n factors                          
ans :: Int -> Int
ans n = case find (\x -> numFactors x > n) triangles of
    Just y -> y  --unwrap the Maybe Int returned by Dat.List find 
    Nothing -> -1

triangles :: [Int]
triangles = scanl (+) 0 [1..]
                      
numFactors :: Int -> Int
numFactors 1= 1
numFactors n = (2 * ( length $ listFactors n)) - (if sqrtPlus n then 1 else 0)
    where sqrtPlus n = (floor $ sqrt $ fromIntegral n)^2 == n 

listFactors  n =  [x | x <- [1..floor $ sqrt $ fromIntegral n], (n `mod` x) == 0]
