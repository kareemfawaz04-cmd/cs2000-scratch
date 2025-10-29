use context dcic2024
data NumList:
| nl-empty
| nl-link(first :: Number, rest :: NumList)
end

fun num-finder(nl :: NumList, n:: Number) -> Boolean:
  doc: "determines if n is in numlist."
  cases (NumList) nl:
    | nl-empty => false
    | nl-link(f, r) => 
      if f == n:
        true
      else:
        num-finder(r, n)
      end
  end
where: 
  num-finder(nl-link(5, nl-link(6, nl-link(7, nl-empty))), 4) is false
  num-finder(nl-empty, 2) is false
end