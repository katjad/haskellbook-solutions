-- standardFunctions.hs
{-# OPTIONS -Wno-unused-top-binds #-}
module StandardFunctions (myOr,myAny,myElem,squish,squishMap,myMaximum,myMinimum) where 

-- Example
    myAnd :: [Bool] -> Bool
    myAnd [] = True
    myAnd (x:xs)
        | not x = False 
        | otherwise = myAnd xs

-- 1. Or
    myOr :: [Bool] -> Bool
    myOr [] = False
    myOr (x:xs)  
        | x = True
        | otherwise =  myOr xs

-- 2. Any 
    myAny :: (a -> Bool) -> [a] -> Bool
    myAny _ [] = False
    myAny a (x:xs) 
        | a x = True
        | otherwise = myAny a xs

-- 3. Elem
    myElem :: Eq a => a -> [a] -> Bool
    myElem _ [] = False
    myElem a (x:xs) 
        | a == x    = True
        | otherwise =  myElem a xs 


    myElem' :: Eq a => a -> [a] -> Bool 
    myElem' a = myAny (== a) 

-- 4. Reverse
    myReverse :: [a] -> [a]
    myReverse [] = []
    myReverse (x:xs) = myReverse xs ++ [x]

-- 5 . Squish
    squish :: [[a]] -> [a]
    squish [] = []
    squish (x:xs) = x ++ squish xs

-- 6. squishMap :: (a -> [b]) -> [a] -> [b]
    squishMap :: (a -> [b]) -> [a] -> [b]
    squishMap _ [] = []
    squishMap f (x:xs) = f x ++ squishMap f xs


-- 7. squishAgain
    squishAgain :: [[a]] -> [a]
    squishAgain = squishMap id

-- 8. myMaximumBy 
    myMaximumBy :: (a -> a -> Ordering) -> [a] -> a   
    myMaximumBy _ [] = undefined
    myMaximumBy _ [x] = x
    myMaximumBy f (x:y:xs) 
        | f x y == GT = myMaximumBy f (xs ++ [x])
        | otherwise   = myMaximumBy f (xs ++ [y])

-- 9. myMinimumBy
    myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
    myMinimumBy _ [] = undefined
    myMinimumBy _ [x] = x 
    myMinimumBy f (x:y:xs)
        | f x y == LT = myMinimumBy f (xs ++ [x])
        | otherwise   = myMinimumBy f (xs ++ [y])

-- 10. maximum and minimum
    myMaximum :: (Ord a) => [a] -> a 
    myMaximum = myMaximumBy compare 

    myMinimum :: (Ord a) => [a] -> a 
    myMinimum = myMinimumBy compare







    