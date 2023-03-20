main :: IO()
main = do 
    print $ removeFistOccurrence 15365 5 == 1536
    print $ removeFistOccurrence 15360 0 == 1536
    print $ removeFistOccurrence 15300 0 == 1530
    print $ removeFistOccurrence 15365 1 == 5365
    print $ removeFistOccurrence 35365 3 == 3565
    print $ removeFistOccurrence 1212 1 == 122
    print $ removeFistOccurrence 1212 2 == 121
    print $ removeFistOccurrence (removeFistOccurrence 1212 1) 1 == 22

removeFistOccurrence :: Int -> Int -> Int
removeFistOccurrence num digit = helper num digit 0 0
 where
    helper :: Int -> Int -> Int -> Int -> Int
    helper 0 _ _ result = result
    helper n d i result
     | mod n 10 == d = helper (div n 10) (-1) (i) (result)
     | otherwise = helper (div n 10) d (i + 1) (result + 10^i * mod n 10)