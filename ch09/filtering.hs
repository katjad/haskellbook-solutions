-- filtering.hs

module Filtering (multipleOf3, howManyMultOf3, removeArticles) where
    
    -- 1.
    multipleOf3 :: [Integer] -> [Integer]
    multipleOf3 = filter (\x -> rem x 3 == 0)

    -- 2.
    howManyMultOf3 :: [Integer] -> Int
    howManyMultOf3 = length . multipleOf3

    -- 3. 
    -- function taken from exercise Thy Fearful Symmetry  
    myExplode :: Char -> String -> [String]
    myExplode _ [] = []
    myExplode x xs
        | head xs == x = myExplode x (tail xs)
        | otherwise      = takeWhile (/= x) xs : myExplode x (dropWhile (/= x) xs)

    
    removeArticles :: String -> [String]
    removeArticles = filter (\x -> x `notElem` ["a", "an", "the"]) . myExplode ' '