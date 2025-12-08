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

# # final-drink-menu = order-by(filter-with(drinks, cheap-drinks-sorted), "price", true)

# t = table: month,amount
#   row: "jan", 123
#   row: "feb", 125
#   row: "march", 143
#   row: "apr",43
# end

# fun avr-rider( r :: Row) -> Boolean:
#   if (r["month"] == "jan") :
#     true
#   else if (r["month"] == "feb"):
#     true
#   else if (r["month"] == "march"):
#     true
#   else:
#     false
#   end
# where:
#   avr-rider(t.row-n(0)) is true
#   avr-rider(t.row-n(1)) is true
#   avr-rider(t.row-n(2)) is true
# avr-rider(t.row-n(3)) is false
# end

# filter-with(t,avr-rider)







# fun fei(t :: Table)-> Table:
#   doc:"wtv"
  
#   fun ie(r :: Row)-> Boolean:
#     r["price"] > 50 
#   end
#   filter-with(t,ie)
  
# where:
#   items = table: item , price
#   row: "apple", 5
#   row: "caviar",200
#   row: "cherry",10
#     end
    
#  result = table: item , price
#     row: "caviar",200
#   end
#   fei(items) is result
#   end


# fun ffs(t :: Table) -> Table:
#   doc:""
#   fun below60(r :: Row) -> Boolean:
#     r["grade"] < 60
#   end
#   filter-with(t,below60)
  
# where:
#   students= table: student, grade
#     row: "kareem", 100
#     row:"camilla",50
#     row:"chris",60
#   end
#   result=table: student, grade
#     row:"camilla", 50
#   end
#       ffs(students) is result
# end

# fun flt(t :: Table) -> Table:
#   doc:"wtv"
  
#   fun over-duration(r :: Row) -> Boolean:
#     r["duration"] > 1200
#   end
#   filter-with(t,over-duration)
# where:
#   trains= table: start-station , duration
#     row: "idk", 10000
#     row:"idc",1000
#     row:"kys",900
#   end
#   result=  table: start-station , duration
#     row: "idk", 10000
#   end
  
#   flt(trains) is result
# end





# fun apc(t :: Table) -> Table:
#   doc:""
#   fun pass(r :: Row) -> Boolean:
#     r["score"] >= 70
#   end
#   build-column(t,"passed",pass)
# where:
#   scores=table: name,score
#     row:"qwer",45
#     row:"lo",68
#     row:"gg",70
#   end 
#   result=table: name,score,passed
#     row:"qwer",45,false
#     row:"lo",68,false
#     row:"gg",70,true
#   end
#   apc(scores) is result
# end

# fun apwt(t :: Table) -> Table:
#   fun tp(r :: Row) -> Number:
#     r["price"] * 1.07
# end
#   build-column(t,"pwt",tp)
# where:
#   stuff=table: item,price
#     row:"qwer",-1
#     row:"lo",0
#     row:"gg",1
#   end 
#   result=table: item,price,pwt
#     row:"qwer",-1, -1.07
#     row:"lo",0, 0
#     row:"gg",1, 1.07
#   end 
#   apwt(stuff) is result
# end



fun count-passing(t :: Table) -> Number:
  doc: "Return how many students have grade >= 70"
  fun passed(r :: Row) -> Boolean:
    r["grade"] >= 70
  end
  passed-students = filter-with(t, passed)
  passed-students.length()

where:
  students = table: name, grade
    row: "Kareem", 100
  end

  result = 1

  count-passing(students) is result
end



