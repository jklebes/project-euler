import Control.Applicative
import Control.Monad
import System.IO
    
-- tempate for the rare inputs of the form
-- T
-- N
-- i11 i12 
-- i21 i22 i23
-- ...
-- iN1 iN2
-- M 
-- i11 i12 i13 i34
-- i21 i22 i23
-- ...
-- iM1 iM2 iM3
-- ...                           

main = do
    t_temp <- getLine
    let t = read t_temp :: Int
    forM_ [1..t] $ \a0  -> do
        n_temp <- getLine
        let n = read n_temp :: Int
        ns_temp <- replicateM n getLine --get list of strings of space-separeted chars
        let ns_str =  map words $ ns_temp
        let ns =  map ( map (read::String->Int) )$ ns_str --list of list of ints
        (putStrLn .show) $ f ns
 
-- your problem-solving function [[int]] -> int here
f :: [[Int]] -> Int
f a = length $ head a
