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

# when running for the first one its build-column(the table name ,then u give it a name to the new one,then add the function
      
#       when running for the second one same idea but its transform-column(the table name, the column name u want to manipulate ,and then the func you made


