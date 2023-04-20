import Control.Applicative
import Control.Monad
import System.IO


main :: IO ()
main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    forM_ [1..t] $ \a0  -> do
        n_temp <- getLine
        let n_t = words n_temp
        let n = read $ n_t!!0 :: Int
        let k = read $ n_t!!1 :: Int
        num <- getLine
        let digits = map (read . (:"")) num :: [Int]
        let ans = biggestProd k digits
        putStrLn (show ans)

biggestProd m digitsList = maximum (map product (sublists m digitsList))      
sublists m digitsList = map (\x -> sublist x m digitsList) [0..((length digitsList)-m)]
sublist x m digitsList = drop x (take (m+x) digitsList)

getMultipleLines :: Int -> IO [String]

getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (x:xs)    
        return ret
