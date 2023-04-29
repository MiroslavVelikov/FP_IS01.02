main :: IO()
main = do
    print $ sumUnique [[1,2,3,2],[-4,-4],[5]] == 9 -- (= 1 + 3 + 5)
    print $ sumUnique [[2,2,2],[3,3,3],[4,4,4]] == 0
    print $ sumUnique [[1,2,3],[4,5,6],[7,8,9]] == 45 

countOfNum :: Int -> [Int] -> Int
countOfNum _ [] = 0
countOfNum digit (x:xs)
 | digit == x = 1 + countOfNum digit xs
 | otherwise = countOfNum digit xs

sumUniqueList :: [Int] -> Int
sumUniqueList xs = helper xs
 where
    helper [] = 0
    helper (y:ys)
     | countOfNum y xs > 1 = helper ys
     | otherwise = y + helper ys

sumUnique :: [[Int]] -> Int
sumUnique xss = sum $ [ x | x <- [sumUniqueList xs | xs <- xss]]