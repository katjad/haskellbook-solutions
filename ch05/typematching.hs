-- typematching.hs


-- Type Matching

-- 1.a, not  -  matches  2.c,
   _ :: Bool -> Bool   

-- 1.b, length  - matches  2.d,
   _ :: [a] -> Int

-- 1.c, concat   - matches 2.b,
   _ :: [[a]] -> [a]

-- 1.d, head   - matches 2.a,
   _ :: [a] -> a

-- 1.e, (<)    - matches 2.e,
   _ :: Ord a => a -> a -> Bool



-- Type Arguments

-- 1. a,
f :: a -> a -> a -> a; f = undefined;
x :: Char; x = undefined;
f x :: Char -> Char -> Char

-- 2. d, 
g :: a -> b -> c -> b; g = undefined;
g 0 'c' "woot" :: Char

-- 3. b,
h :: (Num a, Num b) => a -> b -> b; h = undefined;
h 1.0 2 :: Num b => b

-- 4. c,
h 1 (5.5 :: Double) :: Double

-- 5. a,
jackal :: (Ord a, Eq b) => a -> b -> a; jackal = undefined;
jackal "keyboard" "has the word jackal in it" :: [Char]

-- 6. e,
jackal "keyboard" :: (Eq b) => b -> [Char]

-- 7. d,
kessel :: (Ord a, Num b) => a -> b -> a; kessel = undefined;
kessel 1 2 :: (Num a, Ord a) => a  -- !! Num a does not automatically imply Ord a

-- 8. a,
kessel 1 (2 :: Integer) :: (Num a, Ord a) => a 

-- 9. c,
kessel (1 :: Integer) 2 :: Integer


-- Parametricity

-- 1. Not possible

-- 2.
f :: a -> a -> a
-- Two implementations:
f x y = fst (x,y)
f x y = snd (x,y)

-- 3. 
f :: a -> b -> b
f x y = y
f x y = snd (x,y)