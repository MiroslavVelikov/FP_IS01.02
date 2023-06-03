main :: IO()
main = do
    print $ prune t1 == t2 

t1 :: (Num a) => NTree a
t1 = T 1 [T 2 [T 3 []], T 4 [T 5 [T 6 []]], T 7 [T 8 [], T 9 [T 10 [T 11 []]]]]

t2 :: (Num a) => NTree a
t2 = T 1 [T 2 [T 3 []], T 4 [T 5 []], T 7 [T 8 [], T 9 [T 10 []]]]

data NTree a = T a [(NTree a)]
 deriving(Eq)

getLevel :: NTree a -> Int -> [a]
getLevel (T value []) _ = []
getLevel (T value _) 0 = [value]
getLevel (T value children) k = concatMap (`getLevel` (k - 1)) children

getValue :: NTree a -> a
getValue (T value _) = value

prune :: NTree a -> NTree a
prune t@(T _ []) = t
prune (T value [child])
 | length (getLevel child 1) <= 1 = (T value [T (getValue child) []]) 
 | otherwise = prune child  
prune (T value children) = (T value (map prune children))