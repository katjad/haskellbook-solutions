-- theQuad.hs

data Quad = 
    One 
    | Two
    | Three
    | Four
    deriving (Eq, Show)

eQuad :: Either Quad Quad 
eQuad = undefined
-- can take 8 values (4 + 4)

prodQuad :: (Quad, Quad)
prodQuad =  undefined
-- can take 16 values (4 * 4)

funcQuad :: Quad -> Quad
funcQuad = undefined
-- can take 256 values (4**4)

prodTBool :: (Bool, Bool, Bool)
prodTBool =  undefined
-- can take 8 values (2 * 2 * 2)

gTwo :: Bool -> Bool -> Bool
gTwo = undefined
-- can take 16 values (2**(2*2))

fTwo :: Bool -> Quad -> Quad
fTwo = undefined
-- can take 65536 values (2**(4*4))