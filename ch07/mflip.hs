-- mflip.hs

-- c) Rewrite the following so that it doesn’t 
--use anonymous lambda syntax:
mflip f = \x -> \y -> f y x

mflip' f x y = f y x 