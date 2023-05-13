main :: IO()
main = do
    print $ maxDepthBlueNode colorTree == 2

data Color = Red | Green | Blue
 deriving (Eq)
data Tree = Empty | Node Color Tree Tree

height :: Tree -> Int
height Empty = 0
height (Node _ left right) = 1 + max (height left) (height right)

getLevel :: Tree -> Int -> [Color]
getLevel Empty _ = []
getLevel (Node value _ _) 0 = [value] 
getLevel (Node _ left right) i = (getLevel left (i - 1)) ++ (getLevel right (i - 1))

maxDepthBlueNode :: Tree -> Int
maxDepthBlueNode Empty = 0
maxDepthBlueNode tree = helper $ height tree
 where 
    helper :: Int -> Int
    helper 0 = 0
    helper i
     | elem Blue (getLevel tree i) = i
     | otherwise = helper (i - 1)

--        Blue
--       /    \
--    Red      Red
--    /        /  
-- Green     Blue  
--           /   \
--        Green  Red

colorTree :: Tree
colorTree = Node Blue (Node Red (Node Green Empty Empty) Empty) (Node Red (Node Blue (Node Green Empty Empty) (Node Red Empty Empty)) Empty)