main :: IO()
main = do 
    print $ sumPrimeDivs 0 == 0
    print $ sumPrimeDivs 6 == 5 -- 2 + 3
    print $ sumPrimeDivs 18 == 5 -- 2 + 3
    print $ sumPrimeDivs 19 == 19
    print $ sumPrimeDivs 45136 == 53

isPrime :: Int -> Bool
isPrime n = n > 1 && helper 2
 where
    helper d
     | d >= n = True
     | mod n d == 0 = False
     | otherwise = helper (d + 1)

sumPrimeDivs :: Int -> Int
sumPrimeDivs num = helper num 0
 where
    helper 0 result = result
    helper 1 result = result 
    helper d result
     | mod num d == 0 && isPrime d = helper (d - 1) (result + d)
     | otherwise = helper (d - 1) result