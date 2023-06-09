import Data.List

main :: IO()
main = do
    --TASK01----------------------------------------------
    print $ getNameLengthColor db ((== 'Y'), (> 106)) == [("Pretty Woman",119), ("The Man Who Wasn't There",116), ("Logan's run",120), ("Empire Strikes Back",111), ("Star Trek",132), ("Star Trek: Nemesis",116)]
    print $ getNameLengthColor db ((== 'Y'), (> 237)) == []
    print $ getNameLengthColor db ((== 'Y'), (> 238)) == []
    print $ getNameLengthColor db ((== 'N'), (< 133)) == [("Terms of Endearment",132)]
    print $ getNameLengthColor db ((== 'N'), (< 300)) == [("Terms of Endearment",132)]
    -------------------------------------------------------
    --TASK02-----------------------------------------------
    print $ (getStudios db) [2001] == [("USA Entertainm.", "Stephen Spielberg") , ("Buzzfeed Entertainm.", "Christian Baesler")]
    print $ (getStudios db) [2002] == [("Buzzfeed Entertainm.", "Christian Baesler")]
    print $ (getStudios db) [1990] == [("Disney","Merv Griffin"), ("Buzzfeed Entertainm.", "Christian Baesler")]
    print $ (getStudios db) [1990, 2001, 1976] == [("Disney", "Merv Griffin"), ("USA Entertainm.", "Stephen Spielberg"), ("Buzzfeed Entertainm.", "Christian Baesler")]
    print $ (getStudios db) [1979, 2002] == [("Buzzfeed Entertainm.", "Christian Baesler")]
    
type Title = String
type Year = Int
type Length = Int
type InColor = Char
type StudioName = String

type Name = String
type ProducerID = Int
type Networth = Integer

type Movie = (Title, Year, Length, InColor, StudioName)
type Studio = (Name, ProducerID)
type MovieExec = (Name, ProducerID, Networth)

type MovieDB = ([Movie], [Studio], [MovieExec])

studios :: [Studio]
studios = [("Disney", 199), ("USA Entertainm.", 222), ("Fox", 333), ("Paramount", 123), ("MGM", 555), ("Buzzfeed Entertainm.", 42)]

movieExecs :: [MovieExec]
movieExecs = [("George Lucas", 555, 200000000), ("Ted Turner", 333, 125000000), ("Stephen Spielberg", 222, 100000000),
 ("Merv Griffin", 199, 112000000), ("Calvin Coolidge", 123, 20000000), ("Christian Baesler", 42, 420000)]

movies :: [Movie]
movies = [("Pretty Woman", 1990, 119, 'Y', "Disney"), ("The Man Who Wasn't There", 2001, 116, 'Y', "USA Entertainm."),
 ("Logan's run", 1976, 120, 'Y', "Fox"), ("Star Wars", 1977, -1, 'N', "Fox"), ("Star Wars 2", 1977, 238, 'N', "Fox"),
 ("Empire Strikes Back", 1980, 111, 'Y', "Fox"), ("Star Trek", 1979, 132, 'Y', "Paramount"),
 ("Star Trek: Nemesis", 2002, 116, 'Y', "Paramount"), ("Terms of Endearment", 1983, 132, 'N', "MGM"),
 ("The Usual Suspects", 1995, 106, 'Y', "MGM"), ("Gone With the Wind", 1938, 238, 'Y', "MGM"),
 ("Gone With the Wind 2", 1938, 238, 'Y', "MGM"), ("The Fellowship of the Ring", 2001, -1, 'Y', "USA Entertainm.")]

db :: MovieDB
db = (movies, studios, movieExecs)

--Task01--
getNameLengthColor :: MovieDB -> ((Char -> Bool), (Int -> Bool)) -> [(Title, Length)]
getNameLengthColor (ms, _, _) (mType, mLen) = let longenstMovie = foldl1 (\ acc@(_, maxLen) (title, len) -> if maxLen < len then (title, len) else acc) [(title, len) | (title, _, len, inColor, _) <- ms, inColor == 'Y'] in [ (title, len) | (title, _, len, inColor, _) <- ms, mType inColor && mLen len && len /= snd longenstMovie && len > 0 ]
--Task01 END--
--Task02--
sameStudio :: Movie -> Movie -> Bool 
sameStudio (_, _, _, _, studio1) (_, _, _, _, studio2) = studio1 == studio2    

removeDifferentYears :: [Movie] -> [Movie]
removeDifferentYears = concatMap removeDuplicates . groupBy sameStudio
 where
    removeDuplicates :: [Movie] -> [Movie]
    removeDuplicates groupedMovies
     | length groupedMovies > 1 = filter (\(title, year, _, _, _) -> all (\(_, y, _, _, _) -> y == year) groupedMovies) groupedMovies
     | otherwise = groupedMovies

getStudiosWithoutMovies :: MovieDB -> [(StudioName, Name)]
getStudiosWithoutMovies (ms, ss, mes) = [(studioName, execName) | (execName, stID, _) <- mes, (studioName, studioID) <- (filter (\ (studioName, _) -> not $ any (\ (_, _, _, _, stName) -> stName == studioName) ms) ss), stID == studioID] 

getStudios :: MovieDB -> ([Year] -> [(StudioName, Name)])
getStudios (ms, ss, mes) = let msFiltered = removeDifferentYears ms in (\ ys -> [ (stName, name) | (stName, name, _) <- nubBy (\ (_, pN1, y1) (_, pN2, y2) -> pN1 == pN2 && y1 == y2) [ (studioName, producerName, year) | (_, year, _, _, studioName) <- msFiltered, (stName, execID) <- ss, (producerName, producerID, _) <- mes,
 elem year ys && studioName == stName && execID == producerID]] ++ getStudiosWithoutMovies (ms, ss, mes))