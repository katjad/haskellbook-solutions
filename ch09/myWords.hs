-- myWords.hs 

-- myWords

-- The book's answer to myWords (?)
-- (from https://github.com/nackjicholson/haskellbook-solutions/blob/master/chapter9/exercises.hs)
myWords :: String -> [String]
myWords [] = []
myWords (' ':xs) = myWords xs
myWords xs = takeWhile (/= ' ') xs : myWords (dropWhile (/= ' ') xs)




-- This is my own solution, before I looked up the above;
-- using a tuple where the first value is the list being built up,
-- the second one a string being taken from

take1stWord = takeWhile(/=' ')
drop1stWord = (dropWhile(==' ') . dropWhile(/=' '))

myWords' (x,"") =  x
myWords' (x,y) = myWords' (x ++ [take1stWord y], drop1stWord y)

myWordsK str = myWords' ([], str)
-- In the example in the book the first word in the resulting list
-- is wallfish instead of sheryl, but I don't think that's what they 
-- are asking for; if you wanted to replace it, the function would be 
-- myWordsK str = ((:)"wallfish" . tail . myWords') ([], str)
