use context dcic2024

fun product(numb :: List<Number>) -> Number block:
  
  var total = 1
  for each(x from numb):
    total :=  x * total
    
  end
  total
end
  
