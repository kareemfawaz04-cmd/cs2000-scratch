use context dcic2024



fun my-doubles(numb :: List<Number>) -> Number block:
  
  var result = [list:]
  for each(item from numb):
    v = item * 2
    result :=  result * [list: v]
    
  end
  result
end



fun my-string-lens(sl :: List<String>)-> Number block:
  var result2 = [list:]
  for each(s from sl):
    val = string-length(s)
    result2 := result2 + [list:val]
  end
  result2
end


# sl.map(string-length)


fun my-pos-nums(numb :: List<Number>) -> Number block:
  var result4 = [list:]
  for each(x from numb):
    if x > 0:
      result4 := result4 + [list: x]
    else:
      result4 := result4
    end  
  end
  result4
end
    


    