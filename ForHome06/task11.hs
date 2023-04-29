main :: IO()
main = do
    print $ onlyArithmentic [[3], [1, 2, 3, 4, 5], [3, 5, 8, 9, 11]]  == [[3], [1, 2, 3, 4, 5]]

isArithmentic :: [Int] -> Bool
isArithmentic xs = length xs < 3 || xs == take (length xs) [xs!!0, xs!!1 ..]

onlyArithmentic :: [[Int]] -> [[Int]]
onlyArithmentic = filter isArithmentic