{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}


class TooMany a where
    tooMany :: a -> Bool

instance TooMany Int where
    tooMany n = n > 42
-- tooMany (42::Int)
-- False

newtype Goats = Goats Int deriving (Eq, Show, TooMany)
-- tooMany (Goats 42)
-- False


-- 1. 
instance TooMany (Int, String) where
    tooMany (n, name) = n > 42
-- tooMany (43::Int, "Goats")
-- True

-- -- 2. 
instance TooMany (Int, Int) where
    tooMany (n, m) = (n + m) > 42
-- tooMany (17::Int, 27::Int)
-- True

-- 3. 
instance {-# OVERLAPPABLE #-} (Num a, TooMany a) => TooMany (a, a) where
    tooMany (n, m) = tooMany n || tooMany m
-- can only have this OR 2. We have to delete 2. for this to be called
-- cannot do n + m > 42 unless add Ord a constraint