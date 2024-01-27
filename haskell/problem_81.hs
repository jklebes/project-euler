import Control.Applicative
import Control.Monad
import System.IO
import Data.List.Split

main :: IO ()
main = do
    t_temp <- getLine
    --putStrLn t_temp
    let t = read t_temp :: Int
    ns_temp <- replicateM t getLine 
    let ns_str =  map (splitOn ",") ns_temp -- (splitOn ",") for comma separated, words for space separated
    let ns =  map ( map (read::String->Int) )$ ns_str
    --(putStrLn .show) ns
    let triangles = matrixToTriangles (subtract 1 t) (subtract 1 t) ns
    --(putStrLn .show) $ triangles
    (putStrLn .show) $ f triangles 
    
                                
-- a modification of problem 18, 67 path finder through a triangle
-- this could all be trees and graphs but its ragged arrays
                           
f :: [[Int]] -> Int
f [[]] = -1 
f [[x]] = x -- last top row of 1
f [x:xs] = -1 --should not be left with one row of length >1
f (xs1:xs2:[]) = f $ [combine xs1 xs2] --just 2 rows left
f (xs1:xs2:xss) = f $ (combine xs1 xs2):xss

-- combine a row upwards into another row, replacing each entry at bottom of triangle with min total so far
-- args bottom row xs, second to last row y
combine :: [Int] -> [Int] -> [Int]
combine [x] [y] = [x+y]
combine [x1,x2] [y] = [y+(min x1 x2)]
combine [x] [y1, y2] = [y1+x, y2+x]
combine xs ys 
    |(length xs) == (length ys +1) = (head ys + (min (head xs) (xs !! 1))) : (combine (tail xs) (tail ys))
    |(length xs +1)==(length ys) = (head ys) + (head xs) : combine xs (tail ys)
    | length xs == length ys = (head ys + (min (head xs) (xs !! 1))) : (combine (tail xs) (tail ys))
    | otherwise = [-1] 
-- expect bottom row is one bigger than second to last row
-- or vice versa

--reshape matrix to a diamond with upper left element on top
matrixToTriangles 0 t m = [[head row]| row<- m] ++ (replicate t [])
matrixToTriangles n t m = let rest = matrixToTriangles (n-1) t m in (take n rest) ++ [(row!!n):rowrest |(row,rowrest) <- zip m (drop n rest)] ++ (drop (n+t+1) rest)
