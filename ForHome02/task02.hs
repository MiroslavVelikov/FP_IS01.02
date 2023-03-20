main :: IO()
main = do
    --print $ sumDigitsIter (-13) -- error "n was negative"
    print $ sumDigitsIter 12345 == 15
    print $ sumDigitsIter 123 == 6

sumDigitsIter :: Int -> Int
sumDigitsIter num
 | num < 0 = error "n was negative"
 | otherwise = helper num 0
 where
    helper 0 result = result
    helper num result = helper (div num 10) (result + mod num 10)