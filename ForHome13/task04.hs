main :: IO()
main = do
    print $ leavesAreEquel t1 t2 == True
    print $ leavesAreEquel t3 t4 == False

data BTree = Nil | Node Int BTree BTree

height :: BTree -> Int
height Nil = 0
height (Node _ left right) = 1 + max (height left) (height right)

getLevel :: BTree -> Int -> [Int]
getLevel Nil _ = []
getLevel (Node value _ _) 0 = [value]
getLevel (Node _ left right) k = getLevel left (k - 1) ++ getLevel right (k - 1) 

leavesAreEquel :: BTree -> BTree -> Bool
leavesAreEquel Nil _ = False
leavesAreEquel _ Nil = False
leavesAreEquel bt1@(Node value1 left1 right1) bt2@(Node value2 left2 right2)
 | value1 == value2 && height bt1 == height bt2 = helper (height bt1)
 | otherwise = leavesAreEquel bt1 left2 
 || leavesAreEquel bt1 right2
 || leavesAreEquel bt2 left1 
 || leavesAreEquel bt2 right1
 || leavesAreEquel left1 left2 
 || leavesAreEquel left1 right2 
 || leavesAreEquel right1 right2
 where
    helper :: Int -> Bool
    helper 0 = True
    helper k
     | getLevel bt1 k == getLevel bt2 k = helper (k - 1) 
     | otherwise = False

t1 :: BTree
t1 = Node 10 (Node 1 Nil Nil) (Node 25 Nil (Node 30 (Node 26 Nil Nil) (Node 32 Nil Nil)))

t2 :: BTree
t2 = Node 25 (Node 10 (Node 1 Nil Nil) Nil) (Node 30 (Node 32 Nil Nil) (Node 26 Nil Nil))

t3 :: BTree
t3 = Node 10 (Node 1 Nil Nil) (Node 25 Nil (Node 30 (Node 26 Nil Nil) (Node 32 Nil Nil)))

t4 :: BTree
t4 = Node 10 (Node 1 Nil Nil) (Node 25 Nil (Node 30 (Node 27 Nil Nil) (Node 32 Nil Nil)))