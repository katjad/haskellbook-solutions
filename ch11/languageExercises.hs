import Data.Char

-- 1.

capitalizeWord :: String -> String
capitalizeWord (x:xs) = toUpper x:xs 


-- 2. 

capitalizeParagraph :: String -> String
capitalizeParagraph [] = []
capitalizeParagraph (' ':xs) = ' ' : capitalizeParagraph xs
capitalizeParagraph ('.':xs) = '.' : takeWhile(==' ') xs ++ capitalizeParagraph (dropWhile(==' ') xs)
capitalizeParagraph xs = capitalizeWord $ takeWhile(/= '.') xs ++ capitalizeParagraph (dropWhile(/='.') xs)