import Control.Applicative
import Control.Monad
import System.IO
import Data.Set
import Algebra.Graph.Internal (cartesianProductWith)


main = do
    putStrLn . show $ (sum [1..28123] )-  (sum $ abundantSums 28123)

-- totally naive and inefficient way
abundantSums :: Integral a => a -> [a]
abundantSums x = toList $ cartesianProductWith (\ i j -> if ((i+j)<=x) then (i+j) else 0) (fromList abundant) (fromList abundant)
    where abundant = listAbundant x
    
listAbundant n = [ i | i <- [1..n], factorSum i > i]

factorSum n = sum $ listFactors n

listFactors n = [i | i<-[1.. (n-1)] , mod n i == 0]
