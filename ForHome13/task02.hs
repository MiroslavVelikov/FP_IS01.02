main :: IO()
main = do
    print $ convert tree == (Node 30 (Node 36 (Node 36 Nil Nil) (Node 35 Nil (Node 33 Nil Nil))) (Node 21 (Node 26 Nil Nil) (Node 15 Nil (Node 8 Nil Nil))))

data NTree a = Nil | Node a (NTree a) (NTree a)
 deriving (Show, Eq)

tree :: (Num a) => NTree a
tree = Node 4 (Node 1 (Node 0 Nil Nil) (Node 2 Nil (Node 3 Nil Nil))) (Node 6 (Node 5 Nil Nil) (Node 7 Nil (Node 8 Nil Nil)))

sumIfGreater :: NTree Int -> Int -> Int
sumIfGreater Nil _ = 0
sumIfGreater (Node value left right) num
 | value >= num = value + (sumIfGreater left num) + (sumIfGreater right num)
 | otherwise = (sumIfGreater left num) + (sumIfGreater right num)

convert :: NTree Int -> NTree Int
convert Nil = Nil
convert tree = helper tree
 where
    helper :: NTree Int -> NTree Int
    helper Nil = Nil
    helper (Node value left right) = (Node (sumIfGreater tree value) (helper left) (helper right))