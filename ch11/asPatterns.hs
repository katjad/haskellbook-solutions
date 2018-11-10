import Data.Char


-- 1.

isSubseqOf :: (Eq a) => [a] -> [a] -> Bool

isSubseqOf subseq seq = subseq == findAll subseq seq 
    where findAll :: (Eq a) => [a] -> [a] -> [a]
          findAll [] _      = []
          findAll _ []      = []
          findAll us@(v:vs) ws@(x:xs) 
            | v == x      = v : findAll vs xs
            | otherwise   = findAll us xs


-- 2. 

capitalizeWords :: String -> [(String, String)]
capitalizeWords xs = map tpl (splitWords xs)

splitWords :: String -> [String]
splitWords [] = []
splitWords (' ':xs) = splitWords xs
splitWords xs = takeWhile (/= ' ') xs : splitWords (dropWhile (/= ' ') xs)

tpl :: String -> (String, String)
tpl st@(x:xs) = (st, (toUpper x:xs))