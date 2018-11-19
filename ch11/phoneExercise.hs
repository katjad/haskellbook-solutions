-- phoneExercise.hs

import Data.Char

-- 1. 

data DaPhone = DaPhone [(Char, [Char])] deriving Show                 

myphone = DaPhone [
                     ('1', "1"),
                     ('2', "abc2"),
                     ('3', "def3"),
                     ('4', "ghi4"),
                     ('5', "jkl5"),
                     ('6', "mno6"),
                     ('7', "pqrs7"),
                     ('8', "tuv8"),
                     ('9', "wxyz9"),                     
                     ('0', "+-0 "),
                     ('*', "*^"),
                     ('#', "#.,")
                  ]

getList :: DaPhone -> [(Char, [Char])]
getList (DaPhone ls) = ls

-- 2.

convo :: [String]
convo = ["Wanna play 20 questions",
            "Ya",
            "U 1st haha",
            "Lol ok. Have u ever tasted alcohol",
            "Lol ya",
            "Wow ur cool haha. Ur turn",
            "Ok. Do u think I am pretty Lol",
            "Lol ya",
            "Just making sure rofl ur turn"]



-- validButtons = "1234567890*#"
type Digit = Char

-- Valid presses: 1 and up
type Presses = Int


reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps phone chr 
    | isUpper chr = concat [[('*', 1)] , reverseTaps phone $ toLower chr ]
    | otherwise = [(fst key, taps chr $ snd key)]
    where 
        key = head . filter (inList chr) $ getList phone
        inList :: Char -> (Char, [Char]) -> Bool
        inList char key = elem char (snd key)
        taps :: Char -> [Char] -> Int
        taps chr chrs =  (+1) . length $ takeWhile(/=chr) chrs


cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead phone str = concat $ fmap (\chr -> reverseTaps phone chr) str

convertConvos :: DaPhone -> [String] -> [[(Digit, Presses)]]
convertConvos phone strs = fmap (\str -> cellPhonesDead phone str) strs


-- [
-- -- "Wanna play 20 questions",
-- [('*',1),('9',1),('2',1),('6',2),('6',2),('2',1),('0',4),('7',1),('5',3),('2',1),('9',3),('0',4),('2',4),('0',3),('0',4),('7',2),('8',2),('3',2),('7',4),('8',1),('4',3),('6',3),('6',2),('7',4)],
-- -- "Ya",
-- [('*',1),('9',3),('2',1)],
-- -- "U 1st haha",
-- [('*',1),('8',2),('0',4),('1',1),('7',4),('8',1),('0',4),('4',2),('2',1),('4',2),('2',1)],
-- -- "Lol ok. Have u ever tasted alcohol",
-- [('*',1),('5',3),('6',3),('5',3),('0',4),('6',3),('5',2),('#',2),('0',4),('*',1),('4',2),('2',1),('8',3),('3',2),('0',4),('8',2),('0',4),('3',2),('8',3),('3',2),('7',3),('0',4),('8',1),('2',1),('7',4),('8',1),('3',2),('3',1),('0',4),('2',1),('5',3),('2',3),('6',3),('4',2),('6',3),('5',3)],
-- -- "Lol ya",
-- [('*',1),('5',3),('6',3),('5',3),('0',4),('9',3),('2',1)],
-- -- "Wow ur cool haha. Ur turn",
-- [('*',1),('9',1),('6',3),('9',1),('0',4),('8',2),('7',3),('0',4),('2',3),('6',3),('6',3),('5',3),('0',4),('4',2),('2',1),('4',2),('2',1),('#',2),('0',4),('*',1),('8',2),('7',3),('0',4),('8',1),('8',2),('7',3),('6',2)],
-- -- "Ok. Do u think I am pretty Lol",
-- [('*',1),('6',3),('5',2),('#',2),('0',4),('*',1),('3',1),('6',3),('0',4),('8',2),('0',4),('8',1),('4',2),('4',3),('6',2),('5',2),('0',4),('*',1),('4',3),('0',4),('2',1),('6',1),('0',4),('7',1),('7',3),('3',2),('8',1),('8',1),('9',3),('0',4),('*',1),('5',3),('6',3),('5',3)],
-- -- "Lol ya",
-- [('*',1),('5',3),('6',3),('5',3),('0',4),('9',3),('2',1)],
-- -- "Just making sure rofl ur turn"
-- [('*',1),('5',1),('8',2),('7',4),('8',1),('0',4),('6',1),('2',1),('5',2),('4',3),('6',2),('4',1),('0',4),('7',4),('8',2),('7',3),('3',2),('0',4),('7',3),('6',3),('3',3),('5',3),('0',4),('8',2),('7',3),('0',4),('8',1),('8',2),('7',3),('6',2)]]



-- 3.

-- How many taps per message?

fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = foldr (\(dgts, prs) -> (+prs)) 0 

-- get FingerTaps for a string 
fingerTapsForConvo :: DaPhone -> String -> Presses
fingerTapsForConvo phone str = fingerTaps $ cellPhonesDead phone str

getTapsForAllConvos :: DaPhone -> [String] -> [Presses]
getTapsForAllConvos phone strs = fmap (\str -> fingerTapsForConvo phone str) strs

-- Numbers of Taps for each string in convo 
-- [58,5,23,90,18,65,80,18,75]


-- 4. 

-- Most popular letter in each message?

mostPopularLetter :: String -> Char
mostPopularLetter str = fst $ head $ quicksortTpl $ countChars str

-- taking first 5 in case there's more than one 
mostPopularTuples :: String -> [(Char, Int)] 
mostPopularTuples str = take 5 $ quicksortTpl $ countChars str


countChars :: String -> [(Char, Int)]
countChars str = foldr addToCounter [] str
    where   
            addToCounter :: Char -> [(Char, Int)] -> [(Char, Int)]
            addToCounter chr lst 
                | (toLower chr) `elem` (map fst lst) = map (\(x, y) -> if (toLower chr == x) then (x, y+1) else (x, y)) lst
                | otherwise = concat [[(toLower chr, 1)], lst]


-- found on internet after trying too long to write my own :) 
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort [y | y <- xs, y > x] ++ [x] ++ quicksort [y | y <- xs, y <= x]

quicksortTpl :: [(Char, Int)] -> [(Char, Int)]
quicksortTpl [] = []
quicksortTpl (x:xs) = quicksortTpl [y | y <- xs, snd y > snd x] ++ [x] ++ quicksortTpl [y | y <- xs, snd y <= snd x]


mostPopularAllMsg :: [String] -> [Char]
mostPopularAllMsg xs = fmap mostPopularLetter xs

-- Most popular letters in each message - not counting ' ' space
-- a + n
-- a + y
-- a + h
-- e, o, l
-- l
-- o, u, r
-- t + o
-- l
-- u + r



-- 5.

coolestLtr :: [String] -> Char
coolestLtr xs = mostPopularLetter $ concat xs

coolestTpl :: [String] -> [(Char, Int)]
coolestTpl xs = mostPopularTuples $ concat xs

-- 30 times ' ', 15 times letter 'a'



-- Coolest Word

-- from ch 09
myWords :: String -> [String]
myWords [] = []
myWords (' ':xs) = myWords xs
myWords xs = takeWhile (/= ' ') xs : myWords (dropWhile (/= ' ') xs)

countWords :: [String] -> [(String, Int)]
countWords str = foldr addWToCounter [] str
    where   
            addWToCounter :: String -> [(String, Int)] -> [(String, Int)]
            addWToCounter word strls 
                | word `elem` (map fst strls) = map (\(x, y) -> if (word == x) then (x, y+1) else (x, y)) strls
                | otherwise = concat [[(word, 1)], strls]

-- this additional function is just to get convo down
-- to a flat list of words
wordcounter :: [String] -> [(String, Int)]
wordcounter strs = countWords $ concat (fmap myWords strs)

quicksortWord :: [(String, Int)] -> [(String, Int)]
quicksortWord [] = []
quicksortWord (x:xs) = quicksortWord [y | y <- xs, snd y > snd x] ++ [x] ++ quicksortWord [y | y <- xs, snd y <= snd x]

orderWordsByFreq :: [String] -> [(String, Int)]
orderWordsByFreq strs = quicksortWord $ wordcounter strs

-- most frequent words
-- [("Lol",4),("u",2),("ya",2),("ur",2),("turn",2)]



---------------------
-- Hutton's Razor ---
---------------------

-- 1. 

data Expr = Lit Integer | Add Expr Expr

eval :: Expr -> Integer
eval (Add x y) = eval x + eval y
eval (Lit x)   = x


-- 2. 

printExpr :: Expr -> String
printExpr (Add x y) = printExpr x ++ " + " ++ printExpr y
printExpr (Lit x) = show x
