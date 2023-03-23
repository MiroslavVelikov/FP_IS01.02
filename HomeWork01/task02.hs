main :: IO()
main = do
    print $ getNthSevenlikeNum 2 == 7
    print $ getNthSevenlikeNum 3 == 8
    print $ getNthSevenlikeNum 1 == 1
    print $ getNthSevenlikeNum 4 == 49

toBinary :: Int -> [Int]
toBinary 0 = []
toBinary num = mod num 2 : toBinary (div num 2)

getNthSevenlikeNum :: Int -> Int
getNthSevenlikeNum num = helper (toBinary num) 0
 where
    helper :: [Int] -> Int -> Int
    helper [] _ = 0
    helper (x:xs) i = x * 7^i + helper xs (i + 1)