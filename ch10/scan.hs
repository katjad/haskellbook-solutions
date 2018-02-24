-- scan.hs
{-# OPTIONS -Wno-unused-top-binds #-}
module Scan (fibs, fibsN, fibs20, fibsLess100, factorial, factorial20) where 

fibs :: [Integer]
fibs = 1 : scanl (+) 1 fibs


fibsN :: Int -> Integer
fibsN x = fibs !! x


-- 1. Modify your fibs function to only return the first 20 Fibonacci
-- numbers.
fibs20 :: [Integer]
fibs20 = take 20 fibs 


-- 2. Modify fibs to return the Fibonacci numbers that are less than
-- 100.
fibsLess100 :: [Integer]
fibsLess100 = takeWhile (< 100) fibs


-- 3. Try to write the factorial function from Recursion as a scan.
-- You’ll want scanl again, and your start value will be 1. Warning:
-- this will also generate an infinite list, so you may want to pass it
-- through a take function or similar.
factorial :: [Integer]
factorial = scanl (*) 1 [1..]

factorial20 :: [Integer]
factorial20 = take 20 factorial 