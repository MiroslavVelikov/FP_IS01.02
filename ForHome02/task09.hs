main :: IO()
main = do 
    print $ everyOther 12 == 1
    print $ everyOther 852369 == 628
    print $ everyOther 1714 == 11
    print $ everyOther 12345 == 42
    print $ everyOther 891 == 9
    print $ everyOther 123 == 2
    print $ everyOther 2121 == 22
    print $ everyOther 4736778 == 767
    print $ everyOther 448575 == 784
    print $ everyOther 4214 == 14

everyOther :: Int -> Int
everyOther num = helper num 0 1
 where
    helper 0 result _ = result
    helper num result i
     | even i = helper (div num 10) (result * 10 + mod num 10) (i + 1)
     | otherwise = helper (div num 10) result (i + 1)