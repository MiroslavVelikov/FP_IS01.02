main :: IO()
main = do
    print $ minDepthGreenNode colorTree == 2

data Color = Red | Green | Blue
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

minDepthGreenNode :: Tree -> Int
minDepthGreenNode Empty = 0
minDepthGreenNode tree = minimum $ filter (\ x -> x > 0) $ helper tree 0
 where
    helper :: Tree -> Int -> [Int]
    helper Empty _ = [0]
    helper (Node Green _ _) i = [i]
    helper (Node _ left right) i = (helper left (i + 1)) ++ (helper right (i + 1))