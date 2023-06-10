import Control.Applicative
import Control.Monad
import System.IO
import Data.List

main :: IO ()
main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    forM_ [1..t] $ \a0  -> do
        n_temp <- getLine
        let n = read n_temp :: Int
        putStrLn $ show $ ans n

tripleSum :: Int -> Int -> Int
tripleSum p q = 2*p^2 + 2*p*q

tripleProd :: Int -> (Int, Int) -> Int
tripleProd n (p,q) = (p^2 - q^2)*(2*q*p)*(p^2 + q^2)*r^3
  where r = n `div` (tripleSum p q)

ans :: Int -> Int
ans n = mymaximum (map (tripleProd n) (filter (\t -> checkpq t n) (psqsToCheck n)))

mymaximum [] = -1
mymaximum xs = maximum xs

psqsToCheck :: Int -> [(Int, Int)]
psqsToCheck n = [(p,q) | p <- psToCheck n, q <- qsToCheck p n]

psToCheck n = takeWhile (\x -> 2*x^2 <= n ) [1..]

qsToCheck p n = takeWhile (\x -> (2*p^2 + 2*x*p) <= n ) [1..(p-1)]

checkpq :: (Int,Int) -> Int -> Bool
checkpq (p,q) n = n `mod` (tripleSum p q) == 0