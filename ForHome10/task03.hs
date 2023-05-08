main :: IO()
main = do
    print $ getClosestDistance [(ThreeD 4 5 6), (ThreeD 2 5 10)] == (4.47213595499958, ThreeD 4 5 6, ThreeD 2 5 10)
    print $ getClosestDistance [(ThreeD 4 5 6), (ThreeD 2 5 10), (ThreeD 5 2 (-10)), (ThreeD (-2) 1 45), (ThreeD 12 0 2)] == (4.47213595499958, ThreeD 4 5 6, ThreeD 2 5 10)
    print $ getClosestDistance [(ThreeD 4 5 6), (ThreeD 2 5 10), (ThreeD 5 2 (-10)), (ThreeD (-2) 1 45), (ThreeD 12 0 2), (ThreeD 6 5 4)] == (2.8284271247461903, ThreeD 4 5 6, ThreeD 6 5 4)

    print $ getClosestDistance [(TwoD 4 6), (TwoD 5 10), (TwoD 5 29), (TwoD 1 45), (TwoD 0 2), (TwoD 69 42)] == (4.123105625617661, TwoD 4 6, TwoD 5 10)
   
data Point a = TwoD a a | ThreeD a a a
 deriving (Show, Eq, Read)

getDistance :: (Num a, Integral a, Num b, Floating b) => Point a -> Point a -> (b, Point a, Point a)
getDistance (ThreeD x1 y1 z1) (ThreeD x2 y2 z2) = ((sqrt $ fromIntegral $ (x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2), (ThreeD x1 y1 z1), (ThreeD x2 y2 z2))
getDistance (TwoD x1 y1) (TwoD x2 y2) = ((sqrt $ fromIntegral $ (x2 - x1)^2 + (y2 - y1)^2), (TwoD x1 y1), (TwoD x2 y2))

getClosestDistance :: (Num a, Integral a, Num b, Floating b, Ord b) => [Point a] -> (b, Point a, Point a)
getClosestDistance ps = foldl1 (\ acc@(minDis, _, _) (dis, p1, p2) -> if minDis > dis then (dis, p1, p2) else acc) distances
 where
    distances = filter (\ (dis, _, _) -> dis > 0) $ concat $ map (\ p1 -> map (\ p2 -> getDistance p1 p2) ps) ps