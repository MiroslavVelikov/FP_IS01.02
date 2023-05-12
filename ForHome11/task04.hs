main :: IO()
main = do
    print $ isGraceful t1 == True
    print $ isGraceful t2 == False

data NTree a = Nil | Node a [NTree a]

isGraceful :: (Num a, Integral a) => NTree a -> Bool
isGraceful (Node _ [Nil]) = True
isGraceful (Node parent children) = all (\ (Node child _) -> even $ abs $ parent - child) children && all isGraceful children

t1 :: (Num a) => NTree a
t1 = Node 1 [Node 3 [Nil], Node 5 [Nil], Node 7 [Nil], Node 9 [Nil]]

t2 :: (Num a) => NTree a
t2 = Node 7 [Node 9 [Node 5 [Nil], Node 2 [Nil]]]

--t1:
--    1
-- / / \ \
-- 3 5  7 9

--t2:
--   7
--   |
--   9
--  / \
-- 5   2