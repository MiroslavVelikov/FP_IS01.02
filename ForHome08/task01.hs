import Data.List

main :: IO()
main = do
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 0 1 == [[1]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 1 == [[1, 2], [1, 3]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 2 1 == [[1, 2, 3], [1, 2, 4]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 2 == [[2,3],[2,4]]

type Node = Int
type Graph = [(Node, [Node])]
type Path = [Node]

simplePaths :: Graph -> Int -> Node -> [Path]
simplePaths _ 0 n = [[n]]
simplePaths gs k n = helper gs k [[n],[n]]
 where
    helper :: Graph -> Int -> [Path] -> [Path]
    helper _ 0 res = res
    helper (g:gs) i res
     | fst g >= n = helper gs (i - 1) (take 2 [sort (i : ys) | ys <- res, i <- (snd g)])
     | otherwise = helper gs i res