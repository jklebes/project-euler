main = do
 --input
 t <- getLine
 nsString <- getContents
 let ns =  map (read::String->Int) $ words nsString
 --construct list of numbers generating longest collatz sequence
 --for all numbers from 1 to the largest value we re working with
 let answersList = reverse $ localCollatzMaxima (maximum ns)
 -- pick out answers for numbers given
 let answers =  map (\x -> fst $ last $ takeWhile (\y -> (fst y) < x) answersList ) ns
 --output
 mapM ( putStrLn.show) answers

-- which stating number under n yields longest 
-- Collatz sequence ? 

-- length of a sequence
lenCollatzSeq :: Integral a => a -> a
lenCollatzSeq 1 = 1
lenCollatzSeq x
 | even x = 1 + (lenCollatzSeq (x `div` 2))
 | otherwise = 1 + (lenCollatzSeq (3*x + 1))

-- fills with most successful number so far
-- for example if [1,2,3,4,5,6,7] generate sequence lengths
-- [1,3,5,3,3,7,4] this returns [(1,1),(2,3),(6,7)]
localCollatzMaxima :: Integral a => a -> [(a,a)]
localCollatzMaxima 1 = [(1,1)]
localCollatzMaxima x
 | newLength >= bestLength = (x,newLength) : localCollatzMaximaPrev -- if this number generates seq bigger than rest: put it in list
 | otherwise = localCollatzMaximaPrev
 where 
  localCollatzMaximaPrev = localCollatzMaxima (x-1)
  bestLength = snd $ head $ localCollatzMaximaPrev
  newLength = lenCollatzSeq x
 
