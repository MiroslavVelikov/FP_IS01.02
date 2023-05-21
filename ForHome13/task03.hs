main :: IO()
main = do
    print $ levelSum numberBTree 1 == 11 -- (5 + 6)
    print $ cone numberBTree == True

data NTree a = Nil | Node a (NTree a) (NTree a)

numberBTree :: (Num a) => NTree a
numberBTree = Node 10 (Node 5 (Node 1 Nil Nil) (Node 9 Nil Nil)) (Node 6 (Node 8 Nil Nil) (Node 7 Nil Nil))

levelSum :: NTree Int -> Int -> Int
levelSum Nil _ = 0
levelSum (Node value _ _) 0 = value 
levelSum (Node value left right) k = levelSum left (k - 1) + levelSum right (k - 1)

height :: NTree Int -> Int
height Nil = 0
height (Node _ left right) = 1 + max (height left) (height right)

cone :: NTree Int -> Bool
cone Nil = True
cone t@(Node value _ _) = let h = height t in helper (h - 1) (levelSum t h)
 where
    helper :: Int -> Int -> Bool
    helper 1 prevSum = value < prevSum
    helper k prevSum
     | levelSum t k < prevSum = False
     | otherwise = helper (k - 1) (levelSum t k)