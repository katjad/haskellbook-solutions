-- addOneIfOdd.hs
-- a) Rewrite the f function in the where clause.
addOneIfOdd n = case odd n of
True -> f n
False -> n
where f n = n + 1


addOneIfOdd' n = case odd n of
    True -> f n
    False -> n 
    where f = \n -> n + 1