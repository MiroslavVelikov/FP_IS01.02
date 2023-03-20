main :: IO()
main = do
    print $ findSum 0 2 10 == 3578 -- 510 + 1022 + 2046
    print $ findSum 5 3 5 == 174 -- 26 + 50 + 98

sumN :: Int -> Int -> Int -> Int
sumN a b 0 = a + b
sumN a b n = (2 ^ n) * b + sumN a b (n - 1)

findSum :: Int -> Int -> Int -> Int
findSum a b n = helper (n - 1) 0
 where
    helper 0 _ = a + b
    helper _ 3 = 0
    helper leftover count = (sumN a b leftover) + helper (leftover - 1) (count + 1)