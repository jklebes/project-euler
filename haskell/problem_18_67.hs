import Control.Applicative
import Control.Monad
import System.IO


main :: IO ()
main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    forM_ [1..t] $ \a0  -> do
        n_temp <- getLine
        let n = read n_temp :: Int
        ns_temp <- replicateM n getLine 
        let ns_str =  map words $ ns_temp
        let ns =  map ( map (read::String->Int) )$ ns_str
        (putStrLn .show) $ f $ reverse ns
                                
                            
f :: [[Int]] -> Int
f [[]] = -1
f [[x]] = x
f [x:xs] = -1 --should not be left with one row of length >1
f (xs1:xs2:[]) = f $ [combine xs1 xs2] --just 2 rows left
f (xs1:xs2:xss) = f $ (combine xs1 xs2):xss

combine :: [Int] -> [Int] -> [Int]
combine [x1,x2] [y] = [y+(max x1 x2)]
combine (x1:x2:xs) (y:ys) = (y + (max x1 x2)) : (combine (x2:xs) ys)
