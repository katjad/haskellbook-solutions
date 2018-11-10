-- moodSwing.hs

------------------
--- Mood Swing ---
------------------

data Mood = Blah | Woot deriving Show

-- 1.
-- type constructor: Mood

-- 2. 
-- possible values: Blah, Woot

-- 3. 
-- What's wrong with this type signature
-- changeMood :: Mood -> Woot
-- Woot is a Data Constructor not a Type

-- 4. + 5. 
changeMood :: Mood -> Mood
changeMood Blah = Woot 
changeMood    _ = Blah


-------------------------
--- Find the Mistakes ---
-------------------------

-- 1. 
not True && True

-- 2.
not (7 == 6)

-- 3. 
(1 * 2) > 5

-- 4. 
data PosMood = Happy | Merry deriving (Show, Eq, Ord)
[Merry] > [Happy]

-- 5. 
"[1, 2, 3] " ++ "look at me!"