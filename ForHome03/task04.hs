main :: IO()
main = do
    print $ sumDivisibleNumbers 0 10 5 == 5
    print $ sumDivisibleNumbers 0 100 5 == 990
    print $ sumDivisibleNumbers 100 0 5 == 990

numSum :: Int -> Int
numSum 0 = 0
numSum num = mod num 10 + numSum (div num 10)

sumDivisibleNumbers :: Int -> Int -> Int -> Int
sumDivisibleNumbers start finish k = helper (min (min start finish) k) (max start finish)
 where
    helper :: Int -> Int -> Int
    helper s end
     | s > end = 0
     | mod (numSum s) k == 0 = s + helper (s + 1) end
     | otherwise = helper (s + 1) end 