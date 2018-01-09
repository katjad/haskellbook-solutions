-- ifEvenAdd2.hs

-- 2. The following will add 2 to even numbers and otherwise
-- simply return the input value.
-- ifEvenAdd2 n = if even n then (n+2) else n

ifEvenAdd2 n = if even n then (n+2) else n

ifEvenAdd2' :: Integral a => a -> a
ifEvenAdd2' n = 
     case even n of
       True -> n+2
       False -> n 