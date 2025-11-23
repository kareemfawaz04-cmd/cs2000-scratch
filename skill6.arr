use context dcic2024

# 1. count-leaves

# Return the number of leaf nodes in the tree.

# Example:
# A tree of 3 leaves → returns 3.



data BinTree<a>:
  | leaf(val :: a)
  | node(left :: BinTree<a>, right :: BinTree<a>)
end

fun count-leaves<a>(x :: BinTree<a>)-> Number:
  cases (BinTree<a>) x:
    |leaf(v)=> 1
    |node(left,right)=>
      count-leaves(left) + count-leaves(right)
  end
where:
  count-leaves(leaf(5)) is 1
  count-leaves(node(leaf(1), leaf(2))) is 2
  count-leaves(node(node(leaf(5), leaf(6)),leaf(7))) is 3
end



# 2. sum-tree

# Given a BinTree<Number>, return the sum of all leaf values.

# Example:
# leaf(5) → 5
# node(leaf(2), leaf(8)) → 10


fun sum-tree(x :: BinTree)-> Number:
  cases (BinTree) x:
    |leaf(v)=> v
    |node(left,right)=>
      sum-tree(left) + sum-tree(right)
  end
where:
  sum-tree(node(node(leaf(4), leaf(4)), leaf(0))) is 8
  sum-tree(node(node(node(leaf(3), leaf(4)),leaf(6)),leaf(7))) is 20
    sum-tree(leaf(5)) is 5
end
    


# 2. count-nodes

# Return the total number of nodes (both leaf and internal).
# Example: A tree with 3 leaves and 2 internal nodes → returns 5.



fun count-nodes(x :: BinTree)-> Number:
  cases(BinTree) x:
    |leaf(v)=> 1
    |node(left,right)=>
      1 + count-nodes(left) + count-nodes(right)
  end
where:
  count-nodes(leaf(3)) is 1

  count-nodes(node(leaf(1), leaf(3))) is 3

  count-nodes(node(node(leaf(1), leaf(4)), leaf(3))) is 5
end


# 3. all-leaves-even?

# Return true if every leaf value is even.
# Return false otherwise.
# Example: leaf(4) → true
# node(leaf(2), leaf(5)) → false


fun all-leaves-even(x :: BinTree)-> Boolean:
  cases(BinTree) x:
    |leaf(v)=> 
      num-modulo(v , 2) == 0
    |node(l,r)=>
      (all-leaves-even(l) and all-leaves-even(r))
  end    
where:
all-leaves-even(node(leaf(1),leaf(2))) is false
end
     

# 4. count-zero-leaves

# Return the number of leaves whose value is 0.
# Example: node(leaf(0), leaf(3)) → returns 1

fun count-zero-leaves(x :: BinTree)
  -> Number:
  cases(BinTree) x:
    |leaf(v)=>
      if v == 0 :
        1
      else:
        0
      end
    |node(l,r)=>
      count-zero-leaves(l) + count-zero-leaves(r)
  end
where:
  count-zero-leaves(node(leaf(0) , leaf(3))) is 1
end






# ✅ MEDIUM QUESTIONS (Transformation / Recursion on Subtrees)
# 5. sum-leaf-values

# Return the sum of all leaf values.
# Example: node(leaf(3), node(leaf(1), leaf(2))) → returns 6


fun sml(x :: BinTree)-> Number:
  cases (BinTree) x:
    |leaf(v)=> v
    |node(left,right)=>
      sml(left) + sml(right)
  end
where:
  sml(node(node(leaf(4), leaf(4)), leaf(0))) is 8
  sml(node(node(node(leaf(3), leaf(4)),leaf(6)),leaf(7))) is 20
  sml(leaf(5)) is 5
end
      



# 6. tree-contains?

# Given a tree and a number target, return true if any leaf contains target.
# Otherwise false.
fun tree-contains(x :: BinTree , y :: Number)->Boolean:
  cases(BinTree) x:
    |leaf(v)=>
      if v == y:
        true
      else:
        false
      end
    |node(l,r)=>
      tree-contains(l,y) or tree-contains(r,y)
  end
where:
  tree= node(leaf(2), leaf(4))
  tree-contains(tree , 4 ) is true
  tree-contains(node(leaf(2), leaf(4)) , 3) is false
end
# 7. depth-of-tree

# Return the maximum depth of the tree.
# A single leaf has depth 1.
# node(leaf(1), leaf(2)) has depth 2.
# node(node(leaf(1), leaf(2)), leaf(3)) has depth 3.

fun dot(x :: BinTree)-> Number:
  cases(BinTree) x:
    |leaf(v)=> v 
    |node(l,r)=> num-max(dot(l), dot(r))
  end
where:
  dot(node(node(leaf(1), leaf(2)), leaf(3))) is 3
end

# 8. count-internal-nodes

# (You already saw this but it's a perfect medium-level drill.)
# Return the number of non-leaf nodes.

fun cin(x :: BinTree)-> Number:
  cases(BinTree) x:
    |leaf(v)=> 0
      
    |node(l,r)=>
      1 + cin(l) + cin(r)
  end
where:
  cin(node(node(leaf(1), leaf(2)), leaf(3))) is 2
end




# 1. count-odd-leaves

# Return how many leaves contain odd numbers.



fun col(x :: BinTree)-> Number:
  cases(BinTree) x:
    |leaf(v)=>
      if num-modulo(v,2) == 1:
        1
      else:
        0
      end
    |node(l,r)=>
      col(l) + col(r)
  end
  
where:
  col(node(node(leaf(1), leaf(2)), leaf(3))) is 2
end



# 2. all-positive-leaves

# Return true if every leaf value is greater than 0.

# Example:
# node(leaf(2), leaf(-3))) → false

fun apl(x :: BinTree) -> Boolean:
  doc:"if the leaf is bigger than 0 than it will output true"
  cases(BinTree) x:
    |leaf(v)=> 
      if v > 0:
        true
      else:
        false
      end
    |node(l,r)=> apl(l) and apl(r)
  end
where:
  apl(node(leaf(3), leaf(-2))) is false
  apl(node(leaf(2), leaf(3))) is true
end

# any-leaf-equals?

# Given a tree and a number target, return true if any leaf has that value.

# (Similar to tree-contains but practice again.)

fun ale(x :: BinTree, y :: Number)-> Boolean:
  cases (BinTree) x:
    |leaf(v)=>
      if v == y:
        true
      else:
        false
      end
    |node(l,r)=> ale(l,y) or ale(r,y)
  end
where:
  ale(node(leaf(2), leaf(4)) , 4 ) is true
  ale(node(leaf(3), leaf(-2)), 1) is false
end





# 1️⃣ list-of-leaves

# Return a list of all leaf values from left to right.

# Example:
# node(leaf(3), node(leaf(1), leaf(2))) → [list: 3, 1, 2]


fun lr(x :: BinTree) -> List<Number>:
  cases(BinTree) x:
    |leaf(v)=> [list: v]
    |node(l,r)=>
    append(lr(l),lr(r))
  end
where:
  lr(node(leaf(3), node(leaf(1), leaf(2)))) is [list: 3, 1, 2]
end


# 2️⃣ list-of-even-leaves

# Return a list of all even leaf values.

# Example:
# node(leaf(2), leaf(5)) → [list: 2]


fun loel(x :: BinTree) -> List<Number>:
  cases(BinTree) x:
    |leaf(v)=> 
      if v > 0 :
        [list: v ]
      else:
        [list:] 
      end
    |node(l,r)=>
      append(loel(l), loel(r))
  end
where:
  tree=node(leaf(2), leaf(5))
  loel(tree) is [list: 2, 5]
end






# 3️⃣ list-of-positive-leaves

# Return a list containing only the leaf values greater than 0.

# Example:
# node(leaf(-3), node(leaf(4), leaf(5))) → [list: 4, 5]






# 4️⃣ list-double-leaves

# Return a new tree where every leaf value is doubled, THEN return the list of values in left-to-right order.

# (This mixes transformation + list output.)

# Example:
# node(leaf(2), leaf(3)) → [list: 4, 6]