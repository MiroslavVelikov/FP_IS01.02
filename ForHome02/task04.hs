main :: IO()
main = do
    print $ countOccurences 121 1 == 2
    print $ countOccurences 222 1 == 0
    print $ countOccurences 100 0 == 2
    print $ countOccurences 0 0 == 1

countOccurences :: Int -> Int -> Int
countOccurences 0 0 = 1
countOccurences num digit = helper num
 where
    helper :: Int -> Int
    helper 0 = 0
    helper n
     | mod n 10 == digit = 1 + helper (div n 10)
     | otherwise = helper (div n 10)