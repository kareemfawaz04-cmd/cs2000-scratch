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