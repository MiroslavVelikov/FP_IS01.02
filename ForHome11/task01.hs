import Data.List

main :: IO()
main = do
    print $ height numberBTree == 4
    print $ height charBTree == 3

    print $ average numberBTree == 16.22
    --print $ average charBTree -- should not work

    print $ sumLeaves numberBTree == 119
    -- print $ sumLeaves charBTree -- shouldn't work

    print $ areEqual numberBTree (Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil Nil))) == False
    print $ areEqual charBTree charBTree == True
    print $ areEqual numberBTree (Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 8 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil)))) == False

    print $ setLevels numberBTree == Node (0,5) (Node (1,12) (Node (2,1) (Node (3,96) Nil Nil) Nil) (Node (2,0) Nil Nil)) (Node (1,4) (Node (2,2) Nil Nil) (Node (2,5) Nil (Node (3,21) Nil Nil)))
    print $ setLevels charBTree == Node (0,'k') (Node (1,'a') (Node (2,'h') Nil Nil) (Node (2,'s') Nil Nil)) (Node (1,'l') (Node (2,'e') Nil Nil) (Node (2,'l') Nil Nil))

    print $ mirrorTree numberBTree == Node 5 (Node 4 (Node 5 (Node 21 Nil Nil) Nil) (Node 2 Nil Nil)) (Node 12 (Node 0 Nil Nil) (Node 1 Nil (Node 96 Nil Nil)))
    print $ mirrorTree charBTree == Node 'k' (Node 'l' (Node 'l' Nil Nil) (Node 'e' Nil Nil)) (Node 'a' (Node 's' Nil Nil) (Node 'h' Nil Nil))

-- ​​height (number of nodes along the longest branch);​
-- average - returns the average of the nodes (should work only for trees that store numbers in their nodes);
-- ​​sumLeaves​ - returns the sum of the leaves (should work only for trees that store numbers in their nodes);
-- areEqual - checks whether two trees are identical;
-- setLevels - replaces the values in all nodes with the vector ("level", "value");
-- mirrorTree - returns the symmetric tree.

data BTree a = Nil | Node a (BTree a) (BTree a)
 deriving (Show, Eq)

height :: BTree a -> Int
height Nil = 0
height (Node _ left right) = 1 + max (height left) (height right)

size :: (Num a) => BTree a -> a
size Nil = 0
size (Node _ left right) = 1 + (size left) + (size right)

sumTree :: (Num a) => BTree a -> a
sumTree Nil = 0
sumTree (Node value left right) = value + (sumTree left) + (sumTree right)
 
roundTwoDig :: Double -> Double
roundTwoDig n = (fromIntegral $ round $ n * 100) / 100

average :: (Num a, Integral a) => BTree a -> Double
average tree = roundTwoDig $ (fromIntegral $ sumTree tree) / (fromIntegral $ size tree)  

sumLeaves :: (Num a, Eq a) => BTree a -> a
sumLeaves Nil = 0
sumLeaves (Node value left right)
 | left == Nil && right == Nil = value + (sumLeaves left) + (sumLeaves right)
 | otherwise = (sumLeaves left) + (sumLeaves right)

areEqual :: (Eq a) => BTree a -> BTree a -> Bool
areEqual t1 t2 = t1 == t2

setLevels :: (Num b) => BTree a -> BTree (b, a)
setLevels tree = helper tree 0
 where
    helper :: (Num b) => BTree a -> b -> BTree (b, a)
    helper Nil _ = Nil
    helper (Node value left right) i = Node (i, value) (helper left (i + 1)) (helper right (i + 1))

mirrorTree :: BTree a -> BTree a
mirrorTree Nil = Nil
mirrorTree (Node value left right) = Node value (mirrorTree right) (mirrorTree left)

numberBTree :: BTree Int
numberBTree = Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil)))

charBTree :: BTree Char
charBTree = Node 'k' (Node 'a' (Node 'h' Nil Nil) (Node 's' Nil Nil)) (Node 'l' (Node 'e' Nil Nil) (Node 'l' Nil Nil))