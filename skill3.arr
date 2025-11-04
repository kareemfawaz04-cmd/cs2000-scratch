use context dcic2024
fun positive-number-only(x :: List<Number>) -> List<Number> block:
  var pos-numb = [list:]
  for each(numb from x):
    if numb > 0:
      pos-numb := pos-numb + [list:numb] #not just numb
    else:
      pos-numb
    end
  end
  pos-numb
where:
  positive-number-only([list: -1, 2, 3]) is [list: 2, 3]
end




fun even-numb(l :: List<Number>) -> List<Number> block:
  var ev-numb= [list:]
  for each(nber from l):
   if num-modulo(nber, 2) == 0:
      ev-numb:= ev-numb + [list:nber]
    else:
      false
    end
  end
  ev-numb
where:
  even-numb([list: 2, 4, 6, 7]) is [list: 2, 4 , 6]
end


fun odd-numbers(l :: List<Number>) -> List<Number> block:
  var odds= [list:]
  for each(numb from l):
    if num-modulo(numb,2) == 1:
      odds := odds + [list:numb]
    else:
      false
    end
  end
  odds
where:
  odd-numbers([list: 1,2,3,4,5,6,7]) is [list:1,3,5,7]
end
  




# positive-or-zero-only
# Keep all positive numbers and zeros, remove negatives.

fun positive-or-zero-only(l :: List<Number>)-> List<Number> block:
  var pos-or-0 = [list:]
  for each(numb from l):
    if numb >= 0:
      pos-or-0:= pos-or-0 + [list:numb]
    else:
      false
    end
  end
  pos-or-0
where:
  positive-or-zero-only([list: -5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8]) is [list:0,1,2,3,4,5,6,7,8]
end




# short-words-only
# From a list of strings, keep only words shorter than 5 letters.

fun short-words-only(l :: List<String>) -> List<String> block:
  var words = [list:]
  for each(word from l):
    if string-length(word) <= 3:
      words:= words + [list:word]
  else:
    false
    end
  end
  words
where:
  short-words-only([list: "123456", "123","12" ,"1234"]) is [list: "123","12"] 
end





# long-words-only
# From a list of strings, keep only words longer than 4 letters.

fun long-words-only(l :: List<String>)-> List<String> block:
  var list-of-4 = [list:]
  for each(word from l):
    if string-length(word) > 4 :
      list-of-4:= list-of-4 + [list:word]
    else:
      false
    end
  end
  list-of-4
where:
  long-words-only([list: "qwerte", "123", "123 534", "123 45", "1"]) is [list:"qwerte","123 534", "123 45"]
end



# is-positive
# Write a function that returns true if a number is positive, and false otherwise.

fun is-pos(l :: List<Number>) -> List<Boolean> block:
  var pos-numb = [list:]
  for each(numb from l):
    if numb > 0:
      pos-numb:= pos-numb + [list:true]
    else:
    pos-numb:= pos-numb + [list:false]    
    end
  end
  pos-numb
where:
  is-pos([list: -2,-1,0,1,]) is [list: false,false,false,true]
end



# Write a function square-all(lst) that returns a list where every number in lst is squared.


fun square-all(l :: List<Number>) -> List<Number> block:
  var square-L = [list:]
  for each(numb from l):
    square-L:= square-L + [list: numb * numb]
  end
  square-L
where:
  square-all([list:1,2,3,4,5,-5]) is [list: 1, 4, 9, 16, 25, 25]
end



fun find-max-number(l :: List<Number>) -> List<Number> block:
  doc: "Returns the largest number in the list using for each."
  var num-L = [list:]
  for each(numb from l):
    if num-max(numb):
      num-L := num-L + [list: numb]
    else:
      false
    end
  end
  num-L
where:
  find-max-number([list: 1, 2, 3]) is [list: 3]
  find-max-number([list: 10, 20, 30]) is [list: 30]
  find-max-number([list: 100, 200, 300]) is [list: 300]
end




