main :: IO()
main = do
    print $ simplify "1+2+x"-- == "x+3"
    print $ simplify "x+2+x-2"-- == "2x"
    print $ simplify "x+2-(x-2)"-- == "4"
    print $ simplify "y+2+x-2"-- == "x+y"
    print $ simplify "1+2+x+y+x+z+5-x-x-x+y"-- == "-x+2y+z+8"
    print $ simplify "1+2+x+y+x-(x-x-x)+z+y-9"-- == "3x+2y+z-6"
    print $ simplify "1+2-(3-(3-2))-9"-- == "-8"

simplify :: String -> String
simplify inp = helper inp [] []
 where
    helper :: String -> String -> String -> String
    helper [] _ _ = ""
    helper (x:str) ss sings
     | x == '-' || x == '+' = helper str ss (x:sings)
     | (x >= 'a' && x 'z') || (x >= '1' && x <= '0') = helper str (x:ss) sings
     | otherwise = helper str ss sings