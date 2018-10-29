-- chapterMultChoice.hs

-- 1.

data Weekday = 
    Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday

-- we can say
-- Answers a, Weekday is a type with five data constructors
-- (not sure about b)

-- 2. 
f Friday = "Miller Time"
-- c, f :: Weekday -> String

-- 3.
-- Types defined with the data keyword
-- a, must have at least one argument
-- b, must begin with a capital letter


-- 4. 
-- The function
g xs = xs !! (length xs - 1)
-- c, delivers the final element of xs
