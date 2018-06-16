-- folds.hs

-- 1. 
foldr (*) 1 [1..5]
-- will return same as 
-- a) flip (*) 1 [1..5]
-- b) foldl (flip (*)) 1 [1..5]
-- c) foldl (*) 1 [1..5]

-- Answer: b) and c)


-- 2.
-- Write out the evaluattion steps for 
foldl (flip (*)) 1 [1..3]
(((1 * 1) * 2) * 3)
((1 * 2) * 3)
(2 * 3)
6

-- 3.
-- One difference between foldr and foldl is:
-- a) foldr, but not foldl, traverses the spine of a list from right
-- to left
-- b) foldr, but not foldl, always forces the rest of the fold
-- c) foldr, but not foldl, associates to the right
-- d) foldr, but not foldl, is recursive

-- Answer: c,


-- 4. 
-- Folds are catamorphisms, which means they are generally used
-- to
-- a) reduce structure
-- b) expand structure
-- c) render you catatonic
-- d) generate infinite data structures

-- Answer: a, 


-- 5. 
-- The following are simple folds very similar to what you’ve al-
-- ready seen, but each has at least one error. Please fix them and
-- test in your REPL:
-- a) 
foldr (++) ["woot", "WOOT", "woot"]
-- fixed:
foldr (++) "" ["woot", "WOOT", "woot"] 

-- b) 
foldr max [] "fear is the little death"
-- fixed:
foldr max 'a' "fear is the little death"


-- c) 
foldr and True [False, True]
-- fixed:
foldr (&&) True [False, True]


-- d) 
--This one is more subtle than the previous. Can it ever
-- return a different answer?
foldr (||) True [False, True]
-- Answer: No if the function is (||)

-- e) 
foldl ((++) . show) "" [1..5]
-- fixed:
foldl (flip ((++) . show)) "" [1..5]

-- f) 
foldr const 'a' [1..5]
-- fixed:
foldr const "a" (map show [1..5])
-- or:
import Data.Char
foldr const 'a' (map chr [1..5])

-- g) 
foldr const 0 "tacos"
-- fixed:
foldr const 'a' "tacos"

-- h) 
foldl (flip const) 0 "burritos"
-- fixed:
foldl (flip const) 'a' "burritos"

-- i) 
foldl (flip const) 'z' [1..5]
-- fixed:
foldl (flip const) "z" (map show [1..5])





