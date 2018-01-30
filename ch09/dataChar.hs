-- dataChar.hs
{-# OPTIONS -Wno-unused-top-binds #-}

module DataChar (getUppers, capitalise, wordToUpper) where 

import Data.Char
-- 1.
-- :t isUpper 
-- isUpper :: Char -> Bool

-- :t toUpper 
-- toUpper :: Char -> Char

-- 2. Write a function to filter the uppercase letters in a string
getUppers :: String -> String
getUppers = filter isUpper

-- 3. Write a function that will capitalise the first letter
capitalise :: String -> String
capitalise "" = ""
capitalise (x:xs) = toUpper x:xs

-- 4. Write a function that capitalises all the letters in a string
wordToUpper :: String -> String
wordToUpper "" = ""
wordToUpper (x:xs) = toUpper x: wordToUpper xs

-- 5. + 6. Write a function that capitalises first letter and only returns that; write point-free
firstAsCap :: String -> Char
firstAsCap = toUpper . head 
