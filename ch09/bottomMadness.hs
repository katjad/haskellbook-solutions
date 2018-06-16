-- bottomMadness.hs

-- Will it blow up?
-- 1.
[x^y | x <- [1..5], y <- [2, undefined]]
-- returns the first value, 1, then throws error
-- -> bottom

-- 2.
take 1 $ [x^y | x <- [1..5], y <- [2, undefined]]
-- [1]

-- 3.
sum [1, undefined, 3]
-- bottom

-- 4.
length [1, 2, undefined]
-- 3

-- 5.
length $ [1, 2, 3] ++ undefined
-- bottom

-- 6. 
take 1 $ filter even [1, 2, 3, undefined]
-- [2]

-- 7.
take 1 $ filter even [1, 3, undefined]
-- bottom

-- 8.
take 1 $ filter odd [1, 3, undefined]
-- [1]

-- 9.
take 2 $ filter odd [1, 3, undefined]
-- [1, 3]

-- 10.
take 3 $ filter odd [1, 3, undefined]
-- bottom


-- Is it in normal form?

-- 1.
[1, 2, 3, 4, 5]
-- NF 

-- 2.
1 : 2 : 3 : 4 : _
-- WHNF

-- 3. 
enumFromTo 1 10
-- Neither

-- 4.
length [1, 2, 3, 4, 5]
-- WHNF

-- 5.
sum (enumFromTo 1 10)
-- Neither

-- 6.
['a'..'m'] ++ ['n'..'z']
-- Neither

-- 7.
(_, 'b')
-- WHNF
