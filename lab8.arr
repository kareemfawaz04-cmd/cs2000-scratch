use context dcic2024
# Lab 8 — Ancestor Trees
# Skills: 6

data AncTree:
  | noInfo
  | person(
      name :: String,
      birthyear :: Number,
      eye :: String,
      mother :: AncTree,
      father :: AncTree
    )
end

# Example Trees
alice-tree = person("Alice", 1922, "brown", noInfo, noInfo)
bob-tree = person("Bob", 1922, "brown", noInfo, noInfo)
charlie-tree = person("Charlie", 1945, "brown", alice-tree, bob-tree)
dave-tree = person("Dave", 1946, "green", noInfo, noInfo)
emily-tree = person("Emily", 1971, "blue", charlie-tree, dave-tree)

# Problem 1: count-eye-color
fun count-eye-color(t :: AncTree, target :: String) -> Number:
  cases (AncTree) t:
    | noInfo => 0
    | person(n, b, e, m, f) =>
        (if e == target:
           1
         else:
           0
         end)
         + count-eye-color(m, target)
         + count-eye-color(f, target)
  end
where:
  count-eye-color(emily-tree, "brown") is 3
  count-eye-color(emily-tree, "green") is 1
  count-eye-color(emily-tree, "blue") is 1
  count-eye-color(emily-tree, "hazel") is 0
end

# Problem 2: max-generations
fun max-generations(t :: AncTree) -> Number:
  cases (AncTree) t:
    | noInfo => 0
    | person(_, _, _, m, f) =>
        1 + num-max(max-generations(m), max-generations(f))
  end
where:
  max-generations(noInfo) is 0
  max-generations(alice-tree) is 1
  max-generations(charlie-tree) is 2
  max-generations(emily-tree) is 3
end



