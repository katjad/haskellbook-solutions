-- squarecube.hs
    mySqr  = [x^2  | x <- [1..5]]
    myCube = [y^3 | y <- [1..5]]

-- 1.
-- to print out tuples from squares and cubes:
-- [(x,y) | x <- mySqr, y <- myCube]

-- 2.
-- only use values less than 50
-- [(x,y) | x <- mySqr, y <- myCube, x < 50, y < 50]

-- 3. 
-- How many tupes are there? 
-- length [(x,y) | x <- mySqr, y <- myCube, x < 50, y < 50]
-- 15

