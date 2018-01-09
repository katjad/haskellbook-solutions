-- 1. Which (two or more) of the following are equivalent?
a) mTh x y z = x * y * z
b) mTh x y = \z -> x * y * z
c) mTh x = \y -> \z -> x * y * z
d) mTh = \x -> \y -> \z -> x * y * z
-- Answer:
-- They are all equivalent

-- 2. The type of mTh (above) is Num a => a -> a -> a -> a.
-- Which is the type of mTh 3?
a) Integer -> Integer -> Integer
b) Num a => a -> a -> a -> a
c) Num a => a -> a
d) Num a => a -> a -> a
-- Answer: d, 