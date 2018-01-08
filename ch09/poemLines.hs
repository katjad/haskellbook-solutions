module PoemLines where

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

-- putStrLn sentences -- should print
-- Tyger Tyger, burning bright
-- In the forests of the night
-- What immortal hand or eye
-- Could frame thy fearful symmetry?

-- What we want 'myLines sentences'
-- to equal

shouldEqual = 
    [ "Tyger Tyger, burning bright"
    , "In the forests of the night"
    , "What immortal hand or eye"
    , "Could frame thy fearful symmetry?"
    ]


myLines :: String -> [String]
myLines [] = []
myLines ('\n' : xs) = myLines xs
myLines xs = takeWhile (/= '\n') xs : myLines (dropWhile (/= '\n') xs) 

-- More generic function
myExplode :: Char -> String -> [String]
myExplode x [] = []
myExplode x xs
    | (head xs) == x = myExplode x (tail xs)
    | otherwise      = (takeWhile (/= x) xs) : (myExplode x (dropWhile (/= x) xs))

myLines' = myExplode '\n'


-- The main function here is a small test 
-- to ensure you've written your function 
-- correctly. 


main :: IO ()
main = 
    print $
    "Are they equal? "
    ++ show (myLines' sentences == shouldEqual)
    
   
-- writing myWords function with help of myExplode
myWords :: String -> [String]
myWords = myExplode ' '
myWordsSheryl = myWords "Sheryl wants fun"
