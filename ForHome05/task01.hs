main :: IO()
main = do
    print $ getPrimesLC 1 100 == [7,17,37,47,67,71,73,79,97]
    print $ getPrimesLC 100 1 == [7,17,37,47,67,71,73,79,97]

    print $ getPrimesHOF 1 100 == [7,17,37,47,67,71,73,79,97]
    print $ getPrimesHOF 100 1 == [7,17,37,47,67,71,73,79,97]

isPrime :: Int -> Bool
isPrime n = n > 1 && null (filter (\ x -> mod n x == 0) [2 .. div n 2])

getPrimesLC :: Int -> Int -> [Int]
getPrimesLC n1 n2 = [ x | x <- [1 + min n1 n2 .. -1 + max n1 n2], isPrime x && elem '7' (show x)]

getPrimesHOF :: Int -> Int -> [Int]
getPrimesHOF n1 n2 = filter (\ x -> isPrime x && elem '7' (show x)) [1 + min n1 n2 .. -1 + max n1 n2]