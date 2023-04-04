# For home

# Task 1

Define a function that returns the prime numbers in the range `(x, y)` that contain the digit `7`.

    - Solve using list comprehension in ONE line of code.
    - Solve using higher order functions in ONE line of code.

Test cases:

```haskell
print $ getPrimesLC 1 100 == [7,17,37,47,67,71,73,79,97]
print $ getPrimesLC 100 1 == [7,17,37,47,67,71,73,79,97]

print $ getPrimesHOF 1 100 == [7,17,37,47,67,71,73,79,97]
print $ getPrimesHOF 100 1 == [7,17,37,47,67,71,73,79,97]
```

# Task 2

Define a function that returns the sum of the smallest and greatest palindrome divisors of a natural number greater than `1`.

Test cases:

```haskell
print $ getPalindromes 132465 == 8
print $ getPalindromes 654546 == 8
print $ getPalindromes 100001 == 100012
print $ getPalindromes 21612 == 21614
print $ getPalindromes 26362 == 26364
```

# Task 3

Check whether a seqence of numbers forms an arithmetic progression.

## IF-ELSE AND GUARDS THAT RETURN TRUE OR FALSE ARE FORBIDDEN

Test cases:

> **Hint**: You may find the operator `!!` useful :).

```haskell
print $ isArithmentic [3] == True
print $ isArithmentic [3, 5] == True
print $ isArithmentic [1, 2, 3, 4, 5] == True
print $ isArithmentic [3, 5, 7, 9, 11] == True
print $ isArithmentic [3, 5, 8, 9, 11] == False
print $ isArithmentic [3, 5, 9, 9, 11] == False
```

# Task 4

Define a function that returns the sum of the special numbers in the interval `[x, y]` (`x <= y`). A number is special if it contains `6` and can be expressed as `4k + 1`, where `k` is a whole number.

> **Implementation detail**: Solve the task with ONE line of code.

Test case:

```haskell
print $ specialSum 1 100 == 195 -- 61, 65, 69
```

# Task 5

Define a function that takes a single argument function and returns it applied `n` times.

Test cases:

```haskell
print $ (applyN (\x -> 2 * x) 5) 2 == 64
print $ (applyN (\x -> div x 10) 2) 100 == 1
```

Explanation:

    We apply 2 * x first to 2, then to (2 * 2) and so on. Thus, we get: (((((2 * 2) * 2) * 2) * 2) * 2) => ((((4 * 2) * 2) * 2) * 2) => (((8 * 2) * 2) * 2) => ((16 * 2) * 2) => (32 * 2) => 64

# Task 6

![Alt text](assets/forHomeTask5.png?raw=true "forHomeTask5.png")

Test cases:

```haskell
print $ (pairCompose [(+1), (+2)]) 1 == 5 -- ((1 + 2) + 1) + 1
print $ (pairCompose [(+1), (+2), (+3)]) 1 == 8
```

# Task 7

![Alt text](assets/forHomeTask6.png?raw=true "forHomeTask6.png")

Test cases:

```haskell
print $ (switchsum (\x -> x + 1) (\x -> x * 2) 1) 2 == 3
print $ (switchsum (\x -> x + 1) (\x -> x * 2) 2) 2 == 9
print $ (switchsum (\x -> x + 1) (\x -> x * 2) 3) 2 == 16
print $ (switchsum (\x -> x + 1) (\x -> x * 2) 4) 2 == 30
```

# Task 8

Дефинирайте функция `repeater str`, която получава като аргумент символен низ и връща анонимна функция на два аргумента - `count` и `glue` (число и низ). Оценката на обръщението към върнатата функция е низ, който се получава чрез `count`-кратно повтаряне на низа `str`, при което между всеки две съседни повторения на `str` стои низът `glue`.

> **Implementation detail**: `count` will always be a natural number. You needn't validate it!

Test cases:

```haskell
print $ (repeater "I love Haskell") 3 " " == "I love Haskell I love Haskell I love Haskell"
print $ (repeater "Quack") 5 "!" == "Quack!Quack!Quack!Quack!Quack"
```

# Task 9

For the Vector data type we defined in class, define the following functions:

    dotProduct   - scalar product;
    crossProduct - vector product;
    magnitude    - length of a vector.

> **Implementation detail**: Use the type annotation!

Test cases:

```haskell
print $ dotProduct (1, 2, 3) (7, 4, 1) == 18
print $ dotProduct (5, 2, 159) (0, -1, -2) == (-320)

print $ crossProduct (1, 2, 3) (7, 4, 1) == (-10, 20, -10)
print $ crossProduct (5, 2, 159) (0, -1, -2) == (155, 10, -5)

print $ magnitude (1, 2, 3) == 3.7416573867739413
print $ magnitude (7, 4, 1) == 8.12403840463596
print $ magnitude (-10, 20, -10) == 24.49489742783178
print $ magnitude (5, 2, 159) == 159.0911688309568
print $ magnitude (0, -1, -2) == 2.23606797749979
print $ magnitude (155, 10, -5) == 155.40270267920053
```
