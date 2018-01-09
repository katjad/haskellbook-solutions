-- addFive.hs
-- b) Rewrite the following to use anonymous lambda syn-
-- tax:
addFive x y = (if x > y then y else x) + 5


addFive = \x -> \y -> (if x > y then y else x) + 5