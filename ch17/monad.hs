-- monad.hs
-- Applicative and Monad

module AboutMonad () where

import Control.Monad (join)

bind :: Monad m => (a -> m b) -> m a -> m b
bind f x  = join( fmap f x )

-- example
greeting = [" katja, "," matin "] >>= (++) "hello"

-- <$> is the infix operator of fmap


-- this works
outp :: IO [Char] 
outp =  (++) <$> getLine <*> getLine
showLength :: IO Int
showLength = length <$> outp 
-- or:
showLength' :: IO Int
showLength' = pure (length) <*> outp

-- How to write it in one line
showL :: IO Int
showL = ((length) <$>) ((++) <$> getLine <*> getLine)
-- this works too!
showL' :: IO Int
showL' = fmap length  $ (++) <$> getLine <*> getLine
-- but not 
-- showLen = length <$> $ (++) <$> getLine <*> getLine
-- because you cannot have two infix operators in a row? - parse error

-- Identity
-- -> Data.Functor.Identity.Identity
-- import  Data.Functor.Identity 
-- to make Identity available
