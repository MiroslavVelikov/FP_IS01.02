main :: IO()
main = do
    print $ isInteresting 410 == True
    print $ isInteresting 212 == False
    print $ isInteresting 567 == False
    print $ isInteresting 70 == True 
    print $ isInteresting 5 == True 
    print $ isInteresting 4 == True 

sumDigits :: Int -> Int
sumDigits num = helper num 0
 where
    helper 0 result = result
    helper num result = helper (div num 10) (result + mod num 10)

isInteresting :: Int -> Bool
isInteresting num = mod num (sumDigits num) == 0