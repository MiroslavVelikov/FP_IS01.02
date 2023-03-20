main :: IO()
main = do
    print $ countDigitsIter 12345 == 5
    print $ countDigitsIter 123 == 3
    --print $ countDigitsIter (-13)  -- error "n was negative"

    --print $ countDigitsRec (-13) -- error "n was negative"
    print $ countDigitsRec 12345 == 5
    print $ countDigitsRec 123 == 3

countDigitsIter :: Int -> Int
countDigitsIter num
 | num < 0 = error "n was negative"
 | otherwise = helper num 0
 where
    helper 0 result = result
    helper num result = helper (div num 10) (result + 1)

countDigitsRec :: Int -> Int
countDigitsRec 0 = 0
countDigitsRec num
 | num < 0 = error "n was negative"
 | otherwise = 1 + countDigitsRec (div num 10)