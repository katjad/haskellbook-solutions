-- enum.hs

eftBool :: Bool -> Bool -> [Bool]
eftBool a b  = enumFromTo False True

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd a b = enumFromTo a b

eftInt :: Int -> Int -> [Int]
eftInt a b = enumFromTo (a+0) b

eftChar :: Char -> Char -> [Char]
eftChar a b = enumFromTo (pred (succ a)) b