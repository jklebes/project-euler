import Control.Applicative
import Control.Monad
import System.IO
import Data.Char (digitToInt)

main = do
    let size = 5 --to test: expect 101 at size 5x5
    putStrLn . show $ ans size

steps =  concatMap (replicate 4) [2,4 ..] --[2,2,2,2,4,4,4,4,6,6,6,6,8,...]
diagNumbers size = takeWhile (<= size^2) $ scanl (+) 1 steps
ans size = sum $ diagNumbers size
