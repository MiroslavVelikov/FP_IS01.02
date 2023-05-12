main :: IO()
main = do
    print $ ordered t1 == True
    print $ ordered t2 == False

data VTree a = Nil | Node (a, a) (VTree a) (VTree a)
 deriving (Show, Eq, Ord)

t1 :: (Num a) => VTree a
t1 = Node (3, 10) (Node (5, 8) (Node (6, 7) Nil Nil) (Node (4, 9) Nil Nil)) (Node (2, 12) Nil (Node (1, 15) Nil Nil))

t2 :: (Num a) => VTree a
t2 = Node (3, 10) (Node (5, 8) (Node (6, 7) Nil Nil) (Node (7, 9) Nil Nil)) (Node (2, 12) Nil (Node (1, 15) Nil Nil))

subInterval :: (Ord a) => (a, a) -> (a, a) -> Bool
subInterval (x1, y1) (x2, y2) = x1 <= x2 && y1 >= y2

ordered :: (Ord a) => VTree a -> Bool
ordered (Node _ Nil Nil) = True
ordered (Node value Nil right@(Node rV _ _)) = subInterval rV value && ordered right
ordered (Node value left@(Node lV _ _) Nil) = subInterval value lV && ordered left
ordered (Node value left@(Node lV _ _) right@(Node rV _ _)) = (subInterval value lV && subInterval rV value) && ordered left && ordered right