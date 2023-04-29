import Data.List

main :: IO()
main = do
    print $ getAreas [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] == [78.53981633974483,11.25,113.30000000000001,9.127927385194024,6283.185307179586]
    print $ maxArea [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] == Cylinder 20.0 30.0

    -- 1. The first returns their areas;
    -- 2. The second returns the shape with the biggest area. !! SOLVE USING FOLDING !!
 
data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a
 deriving (Show, Eq)

area :: (Num a, Floating a) => Shape a -> a
area (Circle n) = pi * n^2
area (Rectangle a b) = a * b
area (Triangle a b c) = sqrt(p * (p - a) * (p - b) * (p - c))
 where
    p = (a + b + c) / 2
area (Cylinder r h) = 2 * pi * r * (h + r)

getAreas :: (Num a, Floating a) => [Shape a] -> [a]
getAreas xs = [ area x | x <- xs ]

maxArea :: (Num a, Floating a, Ord a) => [Shape a] -> (Shape a)
maxArea xs = snd $ foldl1 (\ acc@(maxArea, _) (area, shape) -> if area > maxArea then (area, shape) else acc) [ (area x, x) | x <- xs ]