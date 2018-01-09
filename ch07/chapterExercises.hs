-- chapter_exercises.hs

-- 1. A polymorphic function 
    -- a) changes things into sheep when invoked
    -- b) has multiple arguments
    -- c) has a concrete type
    -- d) may resolve to values of different types, depending
    -- on inputs

    -- Answer: d, may resolve to values of different types, depending
    -- on inputs


-- 2. Two functions named f and g have types Char -> String
-- and String -> [String] respectively. The composed func-
-- tion g . f has the type 

    -- a) Char -> String
    -- b) Char -> [String]
    -- c) [[String]]
    -- d) Char -> String -> [String]

    -- Answer: b, Char -> [String]


-- 3. A function f has the type Ord a => a -> a -> Bool and we
-- apply it to one numeric value. What is the type now?
    -- a) Ord a => a -> Bool
    -- b) Num -> Num -> Bool
    -- c) Ord a => a -> a -> Integer
    -- d) (Ord a, Num a) => a -> Bool

    -- Answer: a, Ord a => a -> Bool


-- 4. A function with the type (a -> b) -> c
    -- a) requires values of three different types
    -- b) is a higher-order function
    -- c) must take a tuple as its first argument
    -- d) has its parameters in alphabetical order

    -- Answer: b, is a higher-order function

-- 5. Given the following definition of f, what is the type of f
-- True?

    f :: a -> a
    f x = x

    -- a) f True :: Bool
    -- b) f True :: String
    -- c) f True :: Bool -> Bool
    -- d) f True :: a

    -- Answer: a, f True :: Bool


-- Let's write code
-- 1.
tensDigit :: Integral a => a -> a
tensDigit x = d 
    where xLast = x `div` 10
          d     = xLast `mod` 10

-- a,
tensDigit' :: Integral a => a -> a
tensDigit' x = d
    where xLast = fst (x `divMod` 10)
          d     = snd (xLast `divMod` 10)
-- b, yes the divMod version has the same type

-- c,
hunsD :: Integral a => a -> a
hunsD x = d2
    where xLast = x `div` 100
          d2    = xLast `mod` 10

-- 2.
foldBool3 :: a -> a -> Bool -> a
foldBool3 x _ False = x
foldBool3 _ y True = y

-- Case expression
foldBool :: a -> a -> Bool -> a 
foldBool x y z =
    case z of 
        False -> x
        True -> y

-- Guards
foldBool2 :: a -> a -> Bool -> a
foldBool2 x y z 
    | z == False = x
    | z == True = y
    | otherwise = error "error"


-- 3. 
g :: (a -> b) -> (a, c) -> (b, c)
g f (a,c) = (b,c) 
   where b = f a
