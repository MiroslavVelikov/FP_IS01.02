main :: IO()
main = do 
    print $ maxMultiple 2 7 == 6
    print $ maxMultiple 3 10 == 9
    print $ maxMultiple 7 17 == 14
    print $ maxMultiple 10 50 == 50
    print $ maxMultiple 37 200 == 185
    print $ maxMultiple 7 100 == 98  
    print $ maxMultiple 7 10 == 7
    print $ maxMultiple 4 4 == 4

maxMultiple :: Int -> Int -> Int
maxMultiple num max = helper num 1
 where
    helper num result
     | num * result > max = num * (result - 1) 
     | otherwise = helper num (result + 1)