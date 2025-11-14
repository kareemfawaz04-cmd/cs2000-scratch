use context dcic2024

fun make-positive(lon :: List<Number>) -> List<Number>:
  doc: "take the absolute value of each number in the list"
  
  cases (List) lon:
    | empty => empty
    | link(first, rest) => link(
        if first > 0:
          first
        else:
          0 - first
        end,
        make-positive(rest))
  end
where:
  make-positive([list: ]) is [list: ]
  make-positive([list: -1, 0, 2]) is [list: 1, 0, 2]
end


# fun remove-zeros → remove all 0s from the list

fun remove-zeros(remov :: List<Number>) -> List<Number>:
  doc: "removes all zeros from a list"
  cases (List) remov:
    | empty => empty
    | link(first, rest) =>
      if first == 0:
        remove-zeros(rest)
      else:
        link(first, remove-zeros(rest))
      end
  end
where:
  remove-zeros([list: 1, 0, 2, 0, 3, 0, 4]) is [list: 1, 2, 3, 4]
end





# Design a function count-odds that takes a list of numbers and returns how many numbers are odd.



fun count-odds(odd :: List<Number>) -> Number:
  cases(List) odd:
    |empty => 0
    |link(first,rest) =>
      if num-modulo(first,2) == 1:
        1 + count-odds(rest)
      else:
        count-odds(rest)
      end
  end
where:
  count-odds([list: 3,5,7]) is 3
end

      
# 2. sum-lon (✔)

# Design a function sum-lon that takes a list of numbers and returns the sum of the list.

fun sum-lon(total :: List<Number> ) -> Number:
  cases(List) total:
    |empty=> 0
    |link(first,rest) =>
      first + sum-lon(rest)
  end
where:
  sum-lon([list: 3,5,7]) is 15
end


# Design a function double-all that multiplies every number in a list by 2 and returns the new list.

fun double-all(double :: List<Number>)-> List<Number>:
  cases(List) double:
    |empty=> empty
    |link(first,rest)=>
        link(first * 2, double-all(rest))
  end
  where:
  double-all([list: 3,5,7]) is [list:6,10,14]
end


# 4. count-empty-strings (✔)

# Takes a list of strings. Return how many of them are "".

fun count-empty-strings(waffle :: List<String>)->Number:
  cases(List) waffle:
    |empty=> 0
    |link(first,rest)=>
      if first == "" :
        1 + count-empty-strings(rest)
      else:
        count-empty-strings(rest)
      end
  end
where:
  count-empty-strings([list: "","dfsd",""]) is 2
end

        
   
#       5. add-1-to-all (✔)

# Takes a list of numbers. Return a new list where each number is replaced with number + 1.


fun add1toall(x :: List<Number>)-> List<Number>:
  cases(List) x:
    |empty=> empty
    |link(first,rest)=>
      link(first + 1, add1toall(rest))
  end
  where:
  add1toall([list: 3,5,7]) is [list:4,6,8]
end


# 6. count-in-range (✔✔)

# Takes a list of numbers. Count how many are between 50 and 100, inclusive.


fun count-range(x :: List<Number>)-> Number:
  cases(List) x:
    |empty=> 0
    |link(first,rest)=>
      if (first >= 50) and (first <= 100):
        1 + count-range(rest)
      else:
        count-range(rest)
      end
  end
  where:
  count-range([list: 70,50,34,2345]) is 2
end




# 10. count-target (✔✔)

# Takes a list of numbers and a target number.
# Return how many times the target appears before writing a helper function.

# (You'll need fun count-target(l, t)!)

fun target(x :: List<Number>,t :: Number)-> Number:
  cases(List) x:
    |empty=> 0
    |link(first,rest)=>
      if first == t:
        1 + target(rest,t)
      else:
        target(rest,t)
      end
  end
      where:
  target([list: 1,2,3],1) is 1
end


# 9. remove-negatives (✔✔)

# Returns a list containing only the non-negative numbers (>= 0).


fun noneg(x :: List<Number>) -> List<Number>:
  cases (List) x:
    | empty => empty
    | link(first, rest) =>
        if first >= 0:
          link(first, noneg(rest))
        else:
          noneg(rest)
        end
  end
where:
  noneg([list: -1, 1, 2, 3]) is [list: 1, 2, 3]
end


# Takes a list of numbers and returns the product of all numbers.
# If the list is empty, return 1.


fun prod(x :: List<Number>)-> Number:
  cases(List) x:
    |empty=> 1
    |link(first,rest)=>
        first * prod(rest)
  end
      where:
      prod([list: 1,2,3]) is 6
  prod([list:]) is 1
end



# 7. to-upper-all (✔✔)

# Takes a list of strings and returns a new list where every string is replaced by its uppercase version.

# (Hint: use the built-in string-to-upper)


fun stu(x :: List<String>)-> List<String>:
  cases(List) x:
    |empty=> empty
    |link(first,rest)=>
      link(string-to-upper(first) , stu(rest))
  end
  where:
  stu([list: "yo"]) is [list: "YO"]
end






# 2. even-only

fun eveonly(x :: List<Number>)-> List<Number>:
  cases (List) x:
    |empty => empty
    |link(first,rest)=>
      if num-modulo(first,2) == 0:
        link(first , eveonly(rest))
      else:
        eveonly(rest)
      end
  end
where:
  eveonly([list: 1,2,3]) is [list: 2]
end


fun sumpos(x :: List<Number>)-> Number:
  cases(List) x:
    |empty=> 0 
    |link(first,rest)=>
      if first > 0:
        first + sumpos(rest)
      else:
        sumpos(rest)
      end
  end
where:
  sumpos([list: -1,2,3]) is 5
end


# 8. drop-first-n

# Takes a list of numbers and a number n.
# Return the list after removing the first n items using recursion.

# Example:
# ([1,2,3,4,5], 2) → [3,4,5]

fun remove-negative(x :: List<Number>) -> List<Number>:
  cases (List) x:
    | empty => empty
    | link(first, rest) =>
        if first >= 0:
          link(first, remove-negative(rest))
        else:
          remove-negative(rest)
        end
  end
where:
  remove-negative([list: -4, -2, 2, 4]) is [list: 2,4]
  remove-negative([list: -10, -5, 5, 20]) is [list: 5, 20]
end
