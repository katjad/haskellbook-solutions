-- review.hs
{-# OPTIONS -Wno-unused-top-binds #-}
module Review (stopVowelStop, sVsStartWithP, 
    nounVerbNoun, seekritFunc, seekritFuncPrecise) where 

-- Don't use folds!

-- 1. Given the following sets of consonants and vowels:
stops = "pbtdkg"
vowels = "aeiou"

-- a) Write a function that takes inputs from stops and vowels
-- and makes 3-tuples of all possible stop-vowel-stop com-
-- binations. These will not all correspond to real words in
-- English, although the stop-vowel-stop pattern is common
-- enough that many of them will.

-- b) Modify that function so that it only returns the combina-
-- tions that begin with a p.

-- c) Now set up lists of nouns and verbs (instead of stops and
-- vowels) and modify the function to make tuples represent-
-- ing possible noun-verb-noun sentences.

-- a,
stopVowelStop :: [(Char, Char, Char)]
stopVowelStop = [(x,y,z) | x <- stops,
                        y <- vowels,
                        z <- stops, x /= z ] 

-- b, 
sVsStartWithP :: [(Char, Char, Char)]
sVsStartWithP = [(x,y,z) | x <- stops,
                        y <- vowels,
                        z <- stops, x /= z, x == 'p' ] 

-- c, 
nouns = ["Man", "Fish", "Mouse", "Bat", "Frog"]
verbs = ["eats", "strokes", "looks at", "admires"]

nounVerbNoun :: [([Char],[Char],[Char])]
nounVerbNoun = [(a,b,c) | a <- nouns,
                        b <- verbs,
                        c <- nouns, a /= c ] 

-- 2. 
seekritFunc :: String -> Int
seekritFunc x =
    div (sum (map length (words x)))
        (length (words x))
-- This function returns the average length of words in a text

-- 3. We’d really like the answer to be more precise. Can you rewrite
-- that using fractional division?

seekritFuncPrecise :: String -> Double
seekritFuncPrecise x = (/) (fromIntegral (sum (map length (words x))))
                         (fromIntegral (length (words x)))
-- -- or
seekritFuncPrecise' :: String -> Double
seekritFuncPrecise' x = (/) ((fromIntegral . sum) (map length (words x)))
                        ((fromIntegral . length . words) x)
