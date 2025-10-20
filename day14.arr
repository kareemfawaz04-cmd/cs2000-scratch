use context dcic2024

include csv
include data-source 
import lists as L
# how do i know the librarys to use and what each one does
url= "https://pdi.run/f25-dcic-events-orig.csv"

event-data= load-table: name, email, tickcount, discount, delivery, zip
  source: csv-table-file("event-data.csv",default-options)
  sanitize name using string-sanitizer
  sanitize tickcount using num-sanitizer
  sanitize discount using string-sanitizer
end


# for missing data in columns cant we do column-transform?

# normilizing discount as "BIRTHDAY"< "STUDENT", or "NONE"
fun norm-disc( x :: String)-> String:
  doc:"convert data in discount column"
  if string-replace(string-to-upper(x)," ","") == "BIRTHDAY":
    "BIRTHDAY"
    #     when i chamge the order of the removing of spaces( ""," ") my test cases started to fail, why? is the string replace changes one into the other ?
  else if string-replace(string-to-upper(x)," ","") == "STUDENT":
    "STUDENT"
  else: 
    "NONE"
  end
where:
  norm-disc("") is "NONE"
  norm-disc(" ") is "NONE"
  norm-disc("none") is "NONE"
  norm-disc("birthDAY") is "BIRTHDAY"
  norm-disc("STUDENT") is "STUDENT"
  norm-disc("student") is "STUDENT"
  norm-disc("student ") is "STUDENT"
  norm-disc("blah ") is "NONE"
end

final-table=transform-column(event-data,"discount",norm-disc)

# count(final-table,"discount")


discounts = final-table.get-column("discount")


# we are going to filter discount lists
  

fun real-code( x :: String) -> Boolean:
  not(x == "NONE")
  where:
real-code("abc") is true
real-code("NONE") is false
end


L.distinct(discounts)

valid-codes=L.filter(real-code,L.distinct(discounts))


