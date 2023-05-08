import Data.List

main :: IO()
main = do
    print $ (sumExpr (2+) [0, 1, 2, 3]) 2 == 80
    print $ (sumExpr (*0.8) [0, 1, 2, 3, 4, 5]) 10 == 4345680.0

powList :: (Num a) => a -> Int -> [a]
powList num pow = map (\ x -> num^x) [1 .. pow]

sumExpr :: (Num a) => (a -> a) -> [a] -> (a -> a)
sumExpr f ys = (\ x -> sum $ (zipWith (*) ys (map f (powList x (length ys)))))