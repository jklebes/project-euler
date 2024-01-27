import Control.Applicative
import Control.Monad
import System.IO
import Numeric
import Data.Char

main = do
    let range = 100
    let palindromes = [a | a<-[1..range], (palindrome $ show a ) && (palindrome $ binStr a)]
    putStrLn "Doubly Palindromic:"
    putStrLn . show $ palindromes 
    putStrLn "Sum:"
    putStrLn . show $ sum $ palindromes

binStr :: Int -> String
binStr x = showIntAtBase 2 intToDigit x ""

palindrome :: String -> Bool
palindrome s = take half s == take half (reverse s)
               where half = div (length s) 2

