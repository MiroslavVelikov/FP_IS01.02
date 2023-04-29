main :: IO()
main = do
    print $ getVolumes [(5, 10), (5, 2), (2, 10), (2, 5)] == [785.4, 157.08, 125.66, 62.83]

type Cylinder = (Double, Double)

roundToSecDigit :: Double -> Double
roundToSecDigit num = (fromIntegral $ round $ num * 100) / 100

getVolumes :: [Cylinder] -> [Double]
getVolumes [] = []
getVolumes ((r, h):xs) = roundToSecDigit (pi * r^2 * h) : getVolumes xs 