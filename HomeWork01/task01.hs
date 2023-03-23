main :: IO()
main = do
    print $ eqSumPowDig 100 2 == 0
    print $ eqSumPowDig 1000 2 == 0
    print $ eqSumPowDig 2000 2 == 0
    print $ eqSumPowDig 200 3 == 153
    print $ eqSumPowDig 370 3 == 523
    print $ eqSumPowDig 370 3 == 523
    print $ eqSumPowDig 400 3 == 894
    print $ eqSumPowDig 500 3 == 1301
    print $ eqSumPowDig 1000 3 == 1301
    print $ eqSumPowDig 1500 3 == 1301

powNum :: Int -> Int -> Int
powNum num power = helper num 0
 where
    helper 0 result = result
    helper n result = helper (div n 10) (result + (mod n 10)^power)

eqSumPowDig :: Int -> Int -> Int
eqSumPowDig num power
 | num <= 1 = error "Num must be greater than 1"
 | otherwise = helper num 0
  where
    helper 1 result = result 
    helper n result
     | powNum n power == n = helper (n - 1) (result + powNum n power)
     | otherwise = helper (n - 1) result