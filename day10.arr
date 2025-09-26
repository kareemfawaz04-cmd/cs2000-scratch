use context dcic2024

employees =
  table: name,   hourly-wage, hours-worked
    row: "Harley",  15, 40
    row: "Obi",     20, 45
    row: "Anjali",  18, 39
    row: "Miyako",  18, 40
  end

# function to calculate total wage
fun calculate-wage(r :: Row) -> Number:
  doc: "calculates the total wage for an employee"
  r["hourly-wage"] * r["hours-worked"]
where:
  calculate-wage(employees.row-n(2)) is 18 * 39
  calculate-wage(employees.row-n(0)) is 15 * 40
end

# function to add a raise to one's wage
fun add-raise(wage :: Number) -> Number:
  doc: "increases the wage by $2"
  wage + 2
where:
  add-raise(1) is 3
  add-raise(10) is 12
  add-raise(25) is 27
end

fun add-raises(employee-data :: Table)-> Table:
  
  transform-column(employee-data,"hourly-wage",add-raise)
where:
  emp-test-1 = table: hourly-wage
    row:30
    row:40
    row:10
    row:13
  end
 
#   question: " whats the point of this when we could just run the code we did earlier and do transform-column or "
  
  emp-test-2 = table: hourly-wage
    row:30 + 2
    row:40 + 2
    row:10 + 2  
    row:13 + 2
  end
 
  emp-test-3 = add-row(employees.empty(),
    employees.row-n(2))
  
  emp-test-4 = table: name,hourly-wage, hours-worked
    row: "Anjali", 18 + 2 , 39
  end 
  
  add-raises(emp-test-1) is emp-test-2
  add-raises(emp-test-3) is emp-test-4
  end 

#confused about what we did for emp3 and 4, like the very end test case.







 