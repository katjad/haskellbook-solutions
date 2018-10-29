-- chapterVigenereCipher.hs

{-# OPTIONS -Wno-unused-top-binds #-}
module VigenereCipher () where 

import Data.Char
-- chr 65 - 90 -> A to Z

vigenere key a [] = []
vigenere key a (' ':xs) = ' ': vigenere key a xs
vigenere key a (x:xs) = (encode (mod a key_length)  x ): vigenere key (a+1) xs
    where key_as_numberlist = fmap ((+(-65)) . ord . toUpper) key
          key_length = length key
          encode b x
                | ord x > 64 && ord x < 91 = chr ((mod ((ord x-65) + (key_as_numberlist !! b)) 26) + 65)
                | otherwise = x

-- Testing
testkey :: String
testkey = "ALAMOZ"
-- [0,11,0,12,14,25]

msg :: String
msg = "TEST AZ FAST"
-- "TEST AZ FAST"
--  T+0,E+11,S+0,T+12,,A+14,Z+25,,F+0,A+11,S+0,T+12
-- "TPSF OY FLSF"

expected = "TPSF OY FLSF"
testVigenere = 
    if vigenere testkey 0 msg == expected
    then print "yup okay!"
    else error "test failed!"
