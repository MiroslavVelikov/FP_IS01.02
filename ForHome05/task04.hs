main :: IO()
main = do
    print $ specialSum 1 100 == 195 -- 61, 65, 69

specialSum :: Int -> Int -> Int
specialSum beg end = sum $ filter (\x -> elem '6' (show x) && mod (x - 1) 4 == 0) [beg .. end]