-- chapterExercises.hs

awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]


-- 1.
-- length type signature 
length :: [a] -> Int 
-- now using foldable instead of lists
length :: Foldable t => t a -> Int


-- 2. 
-- a,
length [1, 2, 3, 4, 5] 
-- Answer: 5

-- b,
length [(1, 2), (2, 3), (3, 4)]
-- Answer: 3

-- c,
length allAwesome
-- Answer: 2

-- d) 
length (concat allAwesome)
-- Answer: 5


-- 3. + 4.
6 / 3 -- this works 
6 / length [1, 2, 3] -- this is not compiled
div 6 (length [1,2,3]) -- this works, or can be written: 
6 `div` length [1,2,3]


-- 5. 
2 + 3 == 5
-- Type is Bool, expected result is True

-- 6. 
let x = 5
x + 3 == 5
-- type Bool, result False


-- 7. 

length allAwesome == 2
-- works; value is True

length [1, 'a', 3, 'b']
-- will not work, list needs to have all same types

length allAwesome + length awesome
-- works; value is 5

(8 == 8) && ('b' < 'a')
-- works and will evaluate to False

(8 == 8) && 9
-- will not work as right hand side expected to be Bool,
-- but is Num

-- 8. 
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = (x == reverse x)

-- 9. 
myAbs :: Integer -> Integer
myAbs x = if x > 0 then x else -x
-- myAbs (-4)


-- 10.
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))

-------------------------
--- Correcting syntax ---
-------------------------

-- 1. 
x = (+)

f xs = w `x` 1
	where w = length xs


-- 2. 
id x = x


-- 3. 
f (a, b) = a


-----------------------------------------------
--- Match the function names to their types ---
-----------------------------------------------

-- 1. Which of the following types is the type of show?
-- a) 
show a => a -> String
-- b) 
Show a -> a -> String
-- c) 
Show a => a -> String
-- Answer: c)

-- 2. Which of the following types is the type of (==)?
-- a) 
a -> a -> Bool
-- b) 
Eq a => a -> a -> Bool
-- c) 
Eq a -> a -> a -> Bool
-- d) 
Eq a => A -> Bool
-- Answer: b)


-- 3. Which of the following types is the type of fst?
-- a) 
(a, b) -> a
-- b) 
b -> a
-- c) 
(a, b) -> b
-- Answer: a)



-- 4. Which of the following types is the type of (+)?
-- a) 
(+) :: Num a -> a -> a -> Bool
-- b) 
(+) :: Num a => a -> a -> Bool
-- c) 
(+) :: num a => a -> a -> a
-- d) 
(+) :: Num a => a -> a -> a
-- e) 
(+) :: a -> a -> a
-- Answer: d)