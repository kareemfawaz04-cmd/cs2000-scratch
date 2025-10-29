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