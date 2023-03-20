main :: IO()
main = do
    print $ countPalindromes 5 13 == 5 -- 6 7 8 9 11
    print $ countPalindromes 13 5 == 5 -- 6 7 8 9 11

rev :: Int -> Int
rev num = helper num 0
 where
    helper 0 result = result
    helper num result = helper (div num 10) (result * 10 + mod num 10)

isPalindrom :: Int -> Bool
isPalindrom num = num == rev num

countPalindromes :: Int -> Int -> Int
countPalindromes num1 num2 = helper (1 + min num1 num2) (max num1 num2) 0
 where
    helper minN maxN count
     | minN > maxN = count
     | isPalindrom minN = helper (minN + 1) maxN (count + 1)
     | otherwise = helper (minN + 1) maxN count