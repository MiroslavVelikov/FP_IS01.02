import Data.List

main :: IO()
main = do
    print $ listLeaves [(1, 2, 3), (2, 4, 5)] == [3, 4, 5] -- == [4, 3, 5]
    print $ listLeaves [(2, 4, 5), (1, 2, 3)] == [3, 4, 5] -- == [4, 5, 3]
    print $ listLeaves [(1, 2, 3), (3, 4, 5), (5, 6, 9)] == [2, 4, 6, 9]

listLeaves :: [(Int, Int, Int)] -> [Int]
listLeaves xs = concat $ filter (\ (_:ys) -> null ys) (group $ sort $ concat [ [x, x, y, z] | (x, y, z) <- xs])