main :: IO()
main = do
    print $ minDepthGreenNode colorTree == 2

data Color = Red | Green | Blue
 deriving (Show, Eq)
data Tree = Empty | Node Color Tree Tree

colorTree :: Tree
colorTree = Node Blue (Node Red (Node Green Empty Empty) Empty) (Node Red (Node Blue (Node Green Empty Empty) (Node Red Empty Empty)) Empty)

--     colorTree:
--        Blue
--       /    \
--    Red      Red
--    /        /  
-- Green     Blue  
--           /   \
--        Green  Red

getLevel :: Tree -> Int -> [Color]
getLevel Empty _ = []
getLevel (Node value _ _) 0 = [value] 
getLevel (Node _ left right) i = (getLevel left (i - 1)) ++ (getLevel right (i - 1))

minDepthGreenNode :: Tree -> Int
minDepthGreenNode Empty = 0
minDepthGreenNode tree = helper 0
 where
    helper :: Int -> Int
    helper i
     | elem Green (getLevel tree i) = i
     | otherwise = helper (i + 1)