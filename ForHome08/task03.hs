main :: IO()
main = do
    print $ perimeter (Circle 5) == 31.41592653589793
    print $ perimeter (Rectangle 2.5 4.5) == 14
    print $ perimeter (Rectangle 5.5 20.6) == 52.2
    print $ perimeter (Triangle 5.3 3.9 4.89) == 14.09
    print $ perimeter (Cylinder 2.5 10) == 30
 
    print $ area (Circle 5) == 78.53981633974483
    print $ area (Rectangle 2.5 4.5) == 11.25
    print $ area (Rectangle 5.5 20.6) == 113.30000000000001
    print $ area (Triangle 5.3 3.9 4.89) == 9.127927385194024
    print $ area (Cylinder 20 30) == 6283.185307179586
 
    -- Perimeter of a cylinder: 4*r + 2*h
    -- Area of a cylinder: 2*pi*r*h + 2*pi*r*r 

data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a
 
perimeter :: (Num a, Floating a) => Shape a -> a
perimeter (Circle n) = 2 * pi * n
perimeter (Rectangle a b) = 2 * (a + b)
perimeter (Triangle a b c) = a + b + c
perimeter (Cylinder r h) = 4 * r + 2 * h
 
area :: (Num a, Floating a) => Shape a -> a
area (Circle n) = pi * n^2
area (Rectangle a b) = a * b
area (Triangle a b c) = sqrt(p * (p - a) * (p - b) * (p - c))
 where
    p = perimeter (Triangle a b c) / 2
area (Cylinder r h) = 2 * pi * r * (h + r)