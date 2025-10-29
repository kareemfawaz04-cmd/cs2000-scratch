use context dcic2024


data BST:
  |empty-leaf
  |node(key :: Number, value :: String , left :: BST, right :: BST)
end

n1 = node(30 , "rush", empty-leaf,empty-leaf)
n2= node(33 , "steph", empty-leaf,n1)
n3= node(68 , "ross", empty-leaf,n2)
n4= node(68 , "ross", empty-leaf,n3)

fun height(tree :: BST) _> Number:
  doc:"compute height of the tree"
  
where:
  height(n4) is 2 
  height(empty-leaf) is 
  height(n4) is 2 
    height(n4) is 2 
