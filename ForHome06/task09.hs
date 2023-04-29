import Data.List
import Data.Char

main :: IO()
main = do
    print $ reduceStr "dabAcCaCBAcCcaDD" == "dabCBAcaDD" -- dabAcCaCBAcCcaDD -> dabAaCBAcCcaDD -> dabCBAcCcaDD -> dabCBAcaDD

areTheSameChars :: Char -> Char -> Bool
areTheSameChars x y = toUpper x == toUpper y 

isLowerAndUpper :: Char -> Char -> Bool
isLowerAndUpper x y = isLower x && isUpper y

areEqual :: Char -> Char -> Bool
areEqual x y = (isLowerAndUpper x y || isLowerAndUpper y x) && areTheSameChars x y

reduceStr :: String -> String
reduceStr str = helper str []
 where
    helper :: String -> String -> String
    helper [] newStr = reverse newStr
    helper [x] newStr = reverse $ x : newStr
    helper (x1:x2:xs) newStr
     | areEqual x1 x2 = helper (reverse newStr ++ xs) []
     | otherwise = helper (x2:xs) (x1:newStr)