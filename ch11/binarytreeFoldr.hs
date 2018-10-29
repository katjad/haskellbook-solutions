-- binarytreeFoldr.hs
{-# OPTIONS -Wno-unused-top-binds #-}
module BinaryTreeFoldr () where

data BinaryTree a = 
    Leaf 
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)

foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b 
foldTree _ z Leaf = z
foldTree f z (Node left a right) = foldTree f (f a (foldTree f z left)) right

testTree' :: BinaryTree Integer
testTree' =
    Node (Node Leaf 3 Leaf)
    1
    (Node Leaf 4 Leaf)

expected :: Integer
expected = 8

foldOkay = 
    if foldTree (+) 0 testTree' == expected
    then print "yup okay!"
    else error "test failed!"
