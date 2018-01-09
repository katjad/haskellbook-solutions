-- 1. + 2. Just things to try out

-- 3.
-- The following function returns

pal xs 
  | xs == reverse xs = True
  | otherwise        = False
-- a) xs written backwards when it’s True
-- b) True when xs is a palindrome
-- c) False when xs is a palindrome
-- d) False when xs is reversed

-- Answer: b, 


-- 4. What types of arguments can pal take
-- Answer: It can take any list of one type, for example a list of nummbers, Strings

-- 5. What is the type?
-- Answer: Eq a => [a] -> Bool


-- 6. The following function returns
numbers x 
    | x < 0   = -1
    | x == 0  = 0
    | x > 0   = 1 

-- a) the value of its argument plus or minus 1
-- b) the negation of its argument
-- c) an indication of whether its argument is a positive or
-- negative number or zero
-- d) binary machine language

-- Answer: c, 


-- 7. WHat types of arguments?
-- Answer: Any number 

-- 8. Type of the function numbers
-- Answer: (Ord a, Num a, Num t) => a -> t 
