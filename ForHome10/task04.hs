main :: IO()
main = do
    print $ findUncles t 5 == [3,4]
    print $ findUncles t 7 == [2,4]
    print $ findUncles t 10 == [5]

type Tree = [(Int, [Int])]

t :: Tree
t = [(1,[2,3,4]),(2,[5,6]),(3,[7]),(4,[8,9]),(5,[]),(6,[10]),(7,[]),(8,[]),(9,[]),(10,[])] 

getBrothers :: Tree -> Int -> [Int]
getBrothers [] _ = []
getBrothers ts p
 | elem p (snd $ head ts) = snd $ head ts
 | otherwise = getBrothers (tail ts) p 

findUncles :: Tree -> Int -> [Int]
findUncles [] _ = []
findUncles ts ch = helper ts
 where
    helper :: Tree -> [Int]
    helper tempTs
     | elem ch (snd $ head tempTs) = filter (\ x -> x /= (fst $ head tempTs)) (getBrothers ts (fst $ head tempTs))
     | otherwise = helper (tail tempTs)