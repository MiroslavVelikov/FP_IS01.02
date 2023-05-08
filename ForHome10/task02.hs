main :: IO()
main = do
    print $ coldestCapital [(Country "Bulgaria" "Sofia" [(City "Varna" 0 16), (City "Plovdiv" 120 14), (City "Sofia" 420 13)]), (Country "Germany" "Berlin" [(City "Munchen" 200 15), (City "Berlin" 150 12), (City "Ulm" 210 15)]), (Country "France" "Paris" [(City "Paris" 180 15), (City "Nice" 0 14), (City "Lyon" 500 13)])] == "Germany"

type Name = String
type Capital = Name
type AvgYearlyTemperature = Double
type Elevation = Int

data City = City Name Elevation AvgYearlyTemperature
data Country = Country Name Capital [City]

avgTemp :: [City] -> AvgYearlyTemperature
avgTemp cs = (sum $ map (\ (City _ _ temp) -> temp) cs) / (fromIntegral $ length cs)

coldestCapital :: [Country] -> Name
coldestCapital countries = fst $ foldl1 (\ acc@(_, minTemp) (curName, curTemp) -> if minTemp > curTemp then (curName, curTemp) else acc )
 [(cName, avgTemp cs) | (Country cName _ cs) <- countries] 