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
        forM_ [1..n] $ \a0  -> do
            ns_temp <- getLine
            let ns_t = words ns_temp
            let ns = map (read::String -> Int) $ ns_t
            putStrLn . show $ f ns
        
                            
-- your problem-solving function [int] -> int here
f :: Integral a => [a] -> Int
f a = length a

