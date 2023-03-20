main :: IO()
main = do
    print $ sumSpecialPrimes 5 2 == 392 -- n = 5, d = 2
    print $ sumSpecialPrimes 5 3 == 107
    print $ sumSpecialPrimes 10 3 == 462

isPrime :: Int -> Bool
isPrime n = n > 1 && helper 2
 where
    helper :: Int -> Bool
    helper d
     | fromIntegral d > sqrt (fromIntegral n) = True
     | mod n d == 0 = False
     | otherwise = helper (d + 1)

contains :: Int -> Int -> Bool
contains 0 _ = False
contains num digit
 | mod num 10 == digit = True
 | otherwise = contains (div num 10) digit

sumSpecialPrimes :: Int -> Int -> Int
sumSpecialPrimes n d = sum $ take n $ filter (\ x -> isPrime x && contains x d) [1 .. ]