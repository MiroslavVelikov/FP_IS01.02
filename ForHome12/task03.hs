main :: IO()
main = do
    print $ maxDepthBlueNode colorTree-- == 2

data Color = Red | Green | Blue
data Tree = Empty | Node Color Tree Tree
maxDepthBlueNode :: Tree -> [Int]
maxDepthBlueNode Empty = [0]
maxDepthBlueNode tree = helper tree 0
 where
    helper :: Tree -> Int -> [Int]
    helper Empty _ = [0]
    helper (Node Blue _ _) i = [i]
    helper (Node _ left right) i = (helper left (i + 1)) ++ (helper right (i + 1))

--        Blue
--       /    \
--    Red      Red
--    /        /  
-- Green     Blue  
--           /   \
--        Green  Red

colorTree :: Tree
colorTree = Node Blue (Node Red (Node Green Empty Empty) Empty) (Node Red (Node Blue (Node Green Empty Empty) (Node Red Empty Empty)) Empty)