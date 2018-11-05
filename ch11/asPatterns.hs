-- 1.

isSubseqOf :: (Eq a) => [a] -> [a] -> Bool

isSubseqOf subseq seq = subseq == findAll subseq seq 
    where findAll :: (Eq a) => [a] -> [a] -> [a]
          findAll [] _      = []
          findAll _ []      = []
          findAll us@(v:vs) ws@(x:xs) 
            | v == x      = v : findAll vs xs
            | otherwise   = findAll us xs