use context dcic2024

# Design a function add-bad-year-column that, given a table with columns for year, costs, and revenues, adds a new column called "bad-year" that contains true if the costs exceed revenues for that year, and false otherwise.
t= table: cost, revenues
    row: 2, 1
    row: 1, 2
    row:0,-1
  end

fun add-bad-year(r :: Row) -> Boolean:
  doc:"if the cost is bigger than the revenue it will return true othersise false "
  if r["cost"] > r["revenues"]:
    true
  else:
    false
  end
  
where:
  
  add-bad-year(t.row-n(0)) is true
  add-bad-year(t.row-n(1)) is false
  add-bad-year(t.row-n(2)) is true

end

build-column(t,"bad-year",add-bad-year)

# Design a function find-drought-risks that takes a table with "region", "rainfall-2023" and "rainfall-2024" columns and returns a new table containing only those regions where rainfall amounts decreased from 2023 to 2024.
t2 = table: region,rainfall2023,rainfall2024
row:"Panama",23,22
row:"north korea",4,0
row:"atlantis",250,400
end

fun find-drought-risks(r :: Row) -> Boolean :
  if r["rainfall2023"] > r["rainfall2024"]:
    true
  else:
    false
  end
where:
  find-drought-risks(t2.row-n(0)) is true
  find-drought-risks(t2.row-n(1)) is true
  find-drought-risks(t2.row-n(2)) is false

end

filter-with(t2,find-drought-risks)


t3= table: item,category,price
  row: "dildo","sexual-pleasure", 80
  row:"pocket-pussy","sexual-pleasure",90
  row:"condom","sexual-pleasure",40
end

fun under-fifty(r :: Row) -> Boolean:
  if r["price"] > 50:
    true
  else: 
    false
  end
where:
  under-fifty(t3.row-n(0)) is true
  under-fifty(t3.row-n(1)) is true
  under-fifty(t3.row-n(2)) is false
end
filter-with(t3,under-fifty)



t4= table:department,employees,required
  row: "goon-sec",4,5
  row: "bong-sec",7,3
  row: "thong-sec",10,2
end


    fun find-under-staffed(r :: Row) -> Boolean:
      if r["employees"] < r["required"]:
        true
      else:
        false
      end
        where:
  find-under-staffed(t4.row-n(0)) is true
  find-under-staffed(t4.row-n(1)) is false
  find-under-staffed(t4.row-n(2)) is false
    end
filter-with(t4,find-under-staffed)




t5= table: item,price
  row: "dildo", 80
  row:"pocket-pussy",90
  row:"condom",40
end

fun apply-discount(r :: Row) -> Number:
  r["price"] * 0.9


where:
apply-discount(t5.row-n(0)) is 72
apply-discount(t5.row-n(1)) is 81
apply-discount(t5.row-n(2)) is 36
end
build-column(t5,"discounted-price",apply-discount)
 


t6 = table: item, category,price, is-available
    row:"toy","games", 4 , true
  row:"hair-brush", "self-care", 9 , false
    row:"vaccum","cleaning", 40 ,true
  end

fun final-sale-items(r :: Row ) -> Boolean :
  if (r["price"] <= 20) and (r["is-available"] == true):
    true
  else:
    false
  end
where:
  
  final-sale-items(t6.row-n(0)) is true
  final-sale-items(t6.row-n(1)) is false
  final-sale-items(t6.row-n(2)) is false
end

t6-1=filter-with(t6,final-sale-items)

fun disc(r :: Row) -> Number:
  r["price"] * 0.8
end
build-column(t6-1,"sale-price",disc)
  