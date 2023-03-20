main :: IO()
main = do
    print $ areAmicable 200 300 == False
    print $ areAmicable 220 284 == True
    print $ areAmicable 284 220 == True
    print $ areAmicable 1184 1210 == True
    print $ areAmicable 2620 2924 == True
    print $ areAmicable 6232 6368 == True

sumDivs :: Int -> Int
sumDivs num = helper num 0
 where
    helper 0 result = result
    helper 1 result = result 
    helper d result
     | mod num d == 0 = helper (d - 1) (result + d)
     | otherwise = helper (d - 1) result

areAmicable :: Int -> Int -> Bool
areAmicable num1 num2 = (sumDivs num1) == (sumDivs num2)