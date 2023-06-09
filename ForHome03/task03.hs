main :: IO()
main = do
    -- you may get slightly different results eg. -1.047619047619100 on test 4 <- not a problem
    print $ calcSeriesSum 1 0 == -2.0 -- x = 1, n = 0
    print $ calcSeriesSum 1 1 == -0.6666666666666667
    print $ calcSeriesSum 1 2 == -1.2000000000000002
    print $ calcSeriesSum 1 3 == -1.047619047619048
    print $ calcSeriesSum 1 4 == -1.0814814814814817
    print $ calcSeriesSum 1 5 == -1.0753246753246755
    print $ calcSeriesSum 1 6 == -1.0762718762718764
    -- -(2^1 * x^0) / 1 + (2^2 * x^1) / 1 * (1 + 2) - (2^3 * x^2) / 3 * (3 + 2) ...

calcSeriesSum :: Int -> Int -> Double
calcSeriesSum x n = helper 1 1 3 0
 where
    helper :: Int -> Double -> Double -> Double -> Double
    helper pow d count result
     | pow > n + 1 = result
     | otherwise = helper (pow + 1) (d * count) (count + 2) (result + (fromIntegral $ (-1)^pow * (2^pow * x^(pow - 1))) / d)