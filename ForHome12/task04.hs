import Data.List

main :: IO()
main = do
    print $ closestAverage [(Temp 1 23.6), (Temp 6 24.2), (Temp 11 24.2), (Temp 16 21.2), (Temp 21 23.8), (Temp 26 26.5), (Temp 31 24.5)] == [6, 11, 21]

data Measuring = Temp Int Float

getAverageTemp :: [Measuring] -> Float
getAverageTemp days = (sum [temp | (Temp _ temp) <- days]) / (fromIntegral $ length days)

compareCloseToAvg :: (Int, Float) -> (Int, Float) -> Ordering
compareCloseToAvg (_, closeToAvg1) (_, closeToAvg2) = compare closeToAvg1 closeToAvg2

closestAverage :: [Measuring] -> [Int]
closestAverage [] = []
closestAverage days = let avgTemp = getAverageTemp days in map (\ day -> fst day) $ head $ groupBy (\ (_, closeAvg1) (_, closeAvg2) -> closeAvg1 == closeAvg2) $ sortBy compareCloseToAvg [(day, abs $ temp - avgTemp) | (Temp day temp) <- days]
