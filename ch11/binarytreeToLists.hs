-- binarytreeToLists.hs
module BinaryTreeToLists () where

data BinaryTree a = 
    Leaf 
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)

preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node Leaf b Leaf)  = [b]
preorder (Node left b right) = b : preorder left ++ preorder right


inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node Leaf b Leaf) = [b]
inorder (Node left b right) = inorder left ++ [b] ++ inorder right


testTree :: BinaryTree Integer
testTree = 
    Node (Node Leaf 1 Leaf)
         2
         (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder = 
    if preorder testTree == [2, 1, 3]
    then putStrLn "Preorder fine!"
    else putStrLn "Bad news bears."

testInorder :: IO ()
testInorder = 
    if inorder testTree == [1, 2, 3]
        then putStrLn

         "Inorder fine!"
        else putStrLn "Bad news bears."
