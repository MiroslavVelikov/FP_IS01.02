main :: IO()
main = do
    print $ rev 1 == 1
    print $ rev 123 == 321
    print $ rev 987654321 == 123456789

rev :: Integer -> Integer
rev n
 | n > -1 && n < 10 = n
 | otherwise = helper n 0
 where
    helper 0 result = result
    helper num result = helper (div num 10) (result * 10 + mod num 10)