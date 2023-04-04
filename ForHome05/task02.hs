import Data.List
import Data.Char

main :: IO()
main = do
    print $ getPalindromes 132465 == 8
    print $ getPalindromes 654546 == 8
    print $ getPalindromes 100001 == 100012
    print $ getPalindromes 21612 == 21614
    print $ getPalindromes 26362 == 26364

isPalindrom :: Int -> Bool
isPalindrom num = (reverse $ show num) == show num

getPalindromes :: Int -> Int
getPalindromes num = result
 where
    xs = filter (\x -> isPalindrom x && mod num x == 0 ) [ 2 .. num ]
    result = head xs + last xs