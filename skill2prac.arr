use context dcic2024
# menu = table: item, category, price, is-available
#   row: "Margherita", "pizza", 9, true
#   row: "Pepperoni", "pizza", 13, true
#   row: "Veggie", "pizza", 11, false
#   row: "Garlic Bread", "sides", 5, true
#   row: "Caesar Salad", "salad", 12, true
#   row: "Tiramisu", "dessert", 8, false
# end

# drinks = table: name, typee, price
#   row: "Coffee", "hot", 4
#   row: "Tea", "hot", 3
#   row: "Iced Tea", "cold", 4
#   row: "Lemonade", "cold", 3
#   row: "Smoothie", "cold", 6
# end 
  
#   fun ok(r :: Row) -> Boolean:
#   doc: "Return items that are available and cost ≤ 12."
#     if (r["is-available"] == true) and (r["price"] <= 12):
#     true
#   else:
#     false
#     end
# end

# ready-to-serve = filter-with(menu,ok)

# fun add-discount(r :: Row) -> Number:
#   doc:"takes prices and adds the dicsount to them"
#   r["price"] * 0.9
# end

# menu-with-sales = build-column(menu,"sale-price",add-discount)

# fun cheap-drinks-sorted(r :: Row) -> Boolean:
#   if (r["typee"] == "cold") and (r["price"] <= 5):
#     true
#   else: 
#     false
#   end
# end

# final-drink-menu = order-by(filter-with(drinks, cheap-drinks-sorted), "price", true)

t = table: month,amount
  row: "jan", 123
  row: "feb", 125
  row: "march", 143
  row: "apr",43
end

fun avr-rider( r :: Row) -> Boolean:
  if (r["month"] == "jan") :
    true
  else if (r["month"] == "feb"):
    true
  else if (r["month"] == "march"):
    true
  else:
    false
  end
where:
  avr-rider(t.row-n(0)) is true
  avr-rider(t.row-n(1)) is true
  avr-rider(t.row-n(2)) is true
avr-rider(t.row-n(3)) is false
end

filter-with(t,avr-rider)