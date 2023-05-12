main :: IO()
main = do
    print $ (myPoly [2.7, 3.0 ..]) 2.2 3 == -0.4399999999999998

-- If g is myPoly [2.7, 3.0 ..]
-- then g 2.2 3 -> -0.4399999999999998

myPoly :: (Num a) => [a] -> (a -> Int -> a) 
myPoly xs = (\ x y -> foldl1 (*) [ x - xn | xn <- take y xs])