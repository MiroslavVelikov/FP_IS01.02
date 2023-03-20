main :: IO()
main = do 
    print $ truncatablePrime 3797 == True -- 3797, 379, 37 and 3 are all prime
    print $ truncatablePrime 47 == False -- 47 is prime, but 4 is not

isPrime :: Int -> Bool
isPrime n = n > 1 && helper 2
 where
    helper d
     | fromIntegral d > sqrt (fromIntegral n) = True
     | mod n d == 0 = False
     | otherwise = helper (d + 1)

truncatablePrime :: Int -> Bool
truncatablePrime 0 = True
truncatablePrime num
 | isPrime num = truncatablePrime (div num 10)
 | otherwise = False