-- cardinality.hs

-- 1. 
data PugType = PugData
-- Cardinality of 1

-- 2. 
data Airline = 
	PapuAir 
  | CatapultsR'Us
  | TakeYourChancesUnited
-- Cardinality of 3

--- 3. 
-- minBound  :: Int 16 is -32768, maxBound is 32767
-- 65536


-- 4. 
-- minBound Int
-9223372036854775808
-- maxBound Int
9223372036854775807
-- No instances for Integer; limited just by available memory

-- 5. 
-- 2^8 = 256



-- Exercise For Example

data Example = MakeExample deriving Show

-- 1. Example; when trying to get type of Example, error message, 
-- is looking for Data Constructor of that name

-- 2. Yes :info says instance Show is defined


-- 3. 
data Example' = MakeExample' deriving (Eq, Show)
-- :t MakeExample 
-- MakeExample' :: Int -> Example'