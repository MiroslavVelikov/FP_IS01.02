main :: IO()
main = do
    print $ sortN 1714 == 7411
    print $ sortN 123450 == 543210
    print $ sortN 123405 == 543210
    print $ sortN 123045 == 543210
    print $ sortN 120345 == 543210
    print $ sortN 102345 == 543210
    print $ sortN 8910 == 9810
    print $ sortN 321 == 321
    print $ sortN 29210 == 92210
    print $ sortN 1230 == 3210
    print $ sortN 55345 == 55543
    print $ sortN 14752 == 75421
    print $ sortN 329450 == 954320
    print $ sortN 9125 == 9521

sortN :: Int -> Int
sortN number = helper number 9 0
 where
    helper :: Int -> Int -> Int -> Int
    helper 0 0 result = result
    helper 0 i result = helper number (i - 1) result
    helper num i result
     | mod num 10 == i = helper (div num 10) i (result * 10 + i)
     | otherwise = helper (div num 10) i result