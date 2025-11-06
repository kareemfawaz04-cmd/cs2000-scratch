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


# Problem 3
# Design a function oldest-birth-year that finds the birth year of the oldest person in the tree (the person with the smallest birth year). If the tree is empty, return 2050 (a currently impossible birth year).

fun oldest-birth-year(t :: AncTree) -> Number:
  cases (AncTree) t:
    | noInfo => 2050
    | person(n, b, e, m, f) =>
        num-min(
          b,
          num-min(oldest-birth-year(m), oldest-birth-year(f))
        )
  end
where:
  oldest-birth-year(noInfo) is 2050
  oldest-birth-year(alice-tree) is 1922
  oldest-birth-year(emily-tree) is 1922
end


# Problem 4
# Design a function names-starting-with that returns a list of all names in the tree that start with a given letter (case-insensitive).