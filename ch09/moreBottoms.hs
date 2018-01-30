-- moreBottoms.hs

-- 1. Will the following expression return a value or be ⊥?
take 1 $ map (+1) [undefined, 2, 3]
-- ⊥

-- 2. Will the following expression return a value?
take 1 $ map (+1) [1, undefined, 3]
-- value [2]

-- 3. Will the following expression return a value?
take 2 $ map (+1) [1, undefined, 3]
-- ⊥

-- 4. What does the following mystery function do? What is its
-- type? Describe it (to yourself or a loved one) in standard
-- English and then test it out in the REPL to make sure you
-- were correct.
itIsMystery xs = map (\x -> elem x "aeiou") xs
-- It iterates over the letters of a word and creates a list 
-- where True stands for a vowel and False for a consonant


-- 5. What will be the result of the following functions:
-- a)
map (^2) [1..10]
-- [1,4,9,16,25,36,49,64,81,100]

-- b)
map minimum [[1..10], [10..20], [20..30]]
-- n.b. `minimum` is not the same function
-- as the `min` that we used before
-- 
--[1,10,20] 

-- c)
map sum [[1..5], [1..5], [1..5]]
-- [15,15,15]