-- nums.hs

-- 3. The following compares a value, x, to zero and returns an
-- indicator for whether x is a postive number or negative
-- number. But what if x is 0? You may need to play with
-- the compare function a bit to find what to do.

nums x =
  case compare x 0 of
    LT -> -1
    GT -> 1

nums' x = 
    case compare x 0 of 
        LT -> -1
        GT -> 1
        EQ -> 0        
