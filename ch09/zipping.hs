-- zipping.hs
module Zipping (zip, zipWith) where

    -- 1. Write own zip function
    zip' :: [a] -> [b] -> [(a, b)]
    zip' _ [] = []
    zip' [] _ = []
    zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

    -- 2. Write own zipWith function
    zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
    zipWith' _ [] _ = []
    zipWith' _ _ [] = []
    zipWith' f (x:xs) (y:ys) = f x y : zipWith f xs ys 