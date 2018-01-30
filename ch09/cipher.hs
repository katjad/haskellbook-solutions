-- cipher.hs
{-# OPTIONS -Wno-unused-top-binds #-}
module Cipher (caesar, caesarCaps) where 

import Data.Char

-- testing: transforming characters into numbers
-- x-96 | x <- (fmap ord ['a'..'z'])] 
-- this returns [1..26]

-- convert char 'a' to 'z' to position 
-- in alphabet (toIndex 'a' = 1)
toIndex :: Char -> Int
toIndex  = (+) (-96) . ord 

shiftIndex :: Int -> Char -> Int
shiftIndex x = (+) x . toIndex

-- all in one function
-- shiftIndex' x = (+) x . (+) (-96) . ord 
shiftIndex' :: Int -> Char -> Int
shiftIndex' x =  (+)(x - 96) . ord

indexToChar :: Int -> Char
indexToChar x
    | mod26 < 1  = chr (mod26 + 26 + 96)
    | otherwise  = chr (mod26 + 96)
        where mod26 = x `mod` 26


shiftChar :: Int -> Char -> Char
shiftChar x = indexToChar . shiftIndex' x

-- extended to replace characters other than letters by ' '
shiftChar' :: Int -> Char -> Char
shiftChar' x a 
    | ord a < 96 || ord a > 122 = ' '
    | otherwise         = (indexToChar . shiftIndex' x) a

caesar :: Functor f => Int -> f Char -> f Char
caesar x  = fmap (shiftChar' x)

-- caesar 3 "hello world"  =>  "khoor zruog"
-- caesar (-3) "hello world" =>  "ebiil tloia"


------------
-- Extending the functions to consider uppercase letters

shiftIndexSwitch :: Int -> Int -> Char -> Int
shiftIndexSwitch s x = (+)(x - s) . ord

indexToCharSwitch :: Int -> Int -> Char
indexToCharSwitch s x   
    | mod26 < 1  = chr (mod26 + 26 + s)
    | otherwise  = chr (mod26 + s)
        where mod26 = x `mod` 26

shiftCharSwitch :: Int -> Char -> Char 
shiftCharSwitch _ ' ' = ' '
shiftCharSwitch x a 
    | ord a > 96 && ord a < 123 = (indexToCharSwitch 96 . shiftIndexSwitch 96 x) a
    | ord a > 64 && ord a < 91  = (indexToCharSwitch 64 . shiftIndexSwitch 64 x) a 
    | otherwise                 = a

caesarCaps :: Functor f => Int -> f Char -> f Char
caesarCaps x = fmap (shiftCharSwitch x)

-- caesarCaps 7 "Hello World!"  =>  "Olssv Dvysk!"
-- caesarCaps (-239) "Hello World!"  =>  "Czggj Rjmgy!"

------------

-- Todo : unCaesar
