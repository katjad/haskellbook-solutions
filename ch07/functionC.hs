-- functionC.hs

-- 1. The following should return x when x is greater than y.
functionC x y = if (x > y) then x else y

functionC' :: Ord a => a -> a -> a
functionC' x y = 
    case x > y of
        True -> x
        False -> y
