use context dcic2024
data River:
  |stream(flow-rate :: Number)
  |merge(width :: Number, left :: River, right :: River)
end

a = stream(3)
b = stream(4)
c = stream(5)

m1= merge(10, a, b)
main-river = merge(7, m1, c)

# Design a function max-width that finds the maximum width among all merge points in a river network.
fun max-width(r :: River) -> Number:
  doc: "finds max width among merge points"
  cases (River) r:
    | stream(fl) => 0
    | merge(width, left, right) => 
      num-max(width,
        num-max(max-width(left),
          max-width(right)))
  end
where:
      max-width(main-river) is 10
      max-width(m1) is 10
  max-width(c) is 0
end

# Design a function widen-river that takes a river network and a number, and returns a new network where every merge point is wider by that amount.
fun widen-river(r :: River, num :: Number) -> River:
  doc: "widens all widths in river by given amount"
  cases (River) r:
    | stream(fl) => r
    | merge(width, left, right) =>
      merge(width + num,  widen-river(left, num), widen-river(right, num))
  end
where:
  widen-river(main-river, 2) 
    is merge(9, widen-river(m1, 2), widen-river(c, 2))
  widen-river(m1, 2) is merge(12, a, b)
  widen-river(c, 2) is c
end