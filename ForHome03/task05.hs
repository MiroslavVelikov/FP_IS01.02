main :: IO()
main = do
    print $ p 1 == 1
    print $ p 2 == 5
    print $ p 3 == 12
    print $ p 4 == 22
    print $ p 5 == 35
    print $ p 6 == 51

p :: Int -> Int
p 1 = 1
p num = helper num 0
 where
    helper :: Int -> Int -> Int
    helper 2 result = result + 5
    -- helper num result = helper (num - 1) (result + num * 5 - num * 2 - 2)
    helper num result = helper (num - 1) (result + num * 5 - (num + 1) * 2)
    -- both work