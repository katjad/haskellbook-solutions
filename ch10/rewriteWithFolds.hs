-- rewriteWithFolds.hs
{-# OPTIONS -Wno-unused-top-binds #-}
module RewriteWithFolds () where 

--1. myOr returns True if any Bool in the list is True.
myOr :: [Bool] -> Bool
myOr = foldr (||) False

--2. myAny returns True if a -> Bool applied to any of the values in the
-- list returns True.
myAny :: (a -> Bool) -> [a] -> Bool 
-- Nicked this answer from Dwayne
-- https://github.com/dwayne/haskell-programming/blob/master/ch10/Rewrites.hs
myAny f = foldr ((||) . f) False
-- f        :: a -> Bool
-- (||)     :: Bool -> Bool -> Bool
-- (||) . f :: a -> Bool -> Bool

-- 3. Write two versions of myElem. One version should use folding
-- and the other should use any.
myElem :: Eq a => a -> [a] -> Bool
myElem x = foldr ((||) . (==x)) False

myElem' :: Eq a => a -> [a] -> Bool
myElem' x = any (==x) 


--4. Implement myReverse, don’t worry about trying to make it
-- lazy.
myReverse :: [a] -> [a]
myReverse = foldr (\x -> (++[x])) []
-- Dwayne's solution:
-- myReverse = foldl (flip (:)) []

-- 5. Write myMap in terms of foldr. It should have the same behavior
-- as the built-in map.
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

-- 6. Write myFilter in terms of foldr. It should have the same behav-
-- ior as the built-in filter.
myFilter :: (a -> Bool) -> [a] -> [a]
-- looked this up in Dwayne's solutions
myFilter f = foldr (\a b -> if f a then a : b else b) []

-- 7. squish flattens a list of lists into a list
squish :: [[a]] -> [a]
squish = foldr (++) []

-- 8. squishMap maps a function over a list and concatenates the 
-- results.
squishMap :: (a -> [b]) -> [a] -> [b]
-- from Dwayne
squishMap f = foldr (\a b -> foldr (:) b (f a)) []

-- 9. squishAgain flattens a list of lists into a list. This time re-use the
-- squishMap function.
squishAgain :: [[a]] -> [a]
squishAgain = squishMap ((++) [])

-- 10. myMaximumBy takes a comparison function and a list and returns
-- the greatest element of the list based on the last value that the
-- comparison returned GT for.
myMaximumBy :: (a -> a -> Ordering) 
            -> [a] 
            -> a
-- I almost got this, just I did not know what to take as the initial value!
-- Solution by Dwayne
myMaximumBy f xs = foldr (\a b -> if f a b == GT then a else b) (last xs) xs

-- 11. myMinimumBy takes a comparison function and a list and returns
-- the least element of the list based on the last value that the
-- comparison returned LT for.
myMinimumBy :: (a -> a -> Ordering)
            -> [a]
            -> a
myMinimumBy f xs = foldr (\a b -> if f a b == LT then a else b) (last xs) xs
