use context dcic2024

import lists as L

book-transactions = table: transaction-id, date-time, book-title, book-genres, total-amount
  row: "TXN001", "2024-10-01 14:23", "1984", "Fiction", 18.98
  row: "TXN002", "2024-10-01 16:45", "Crime and Punishment", "Fiction", 20.98
  row: "TXN003", "2024-10-02 09:12", "Where the Crawdads Sing", "Fiction", 19.98
  row: "TXN004", "2024-10-02 11:30", "Atomic Habits", "Self-Help", 22.98
  row: "TXN005", "2024-10-03 13:15", "Klara and the Sun", "Sci-Fi", 32.98
  row: "TXN006", "2024-10-03 15:42", "Project Hail Mary", "Sci-Fi", 34.98
  row: "TXN007", "2024-10-04 10:05", "Evicted", "Non-Fiction", 20.98
  row: "TXN008", "2024-10-04 12:18", "1984", "Fiction", 18.98
  row: "TXN009", "2024-10-05 14:33", "Atomic Habits", "Self-Help", 22.98
  row: "TXN010", "2024-10-05 16:20", "The Seven Husbands of Evelyn Hugo", "Fiction", 14.50
  row: "TXN011", "2024-10-06 08:45", "Educated", "Memoir", 17.25
  row: "TXN012", "2024-10-06 10:15", "Dune", "Sci-Fi", 29.99
  row: "TXN013", "2024-10-06 12:30", "The Midnight Library", "Fiction", 16.75
  row: "TXN014", "2024-10-07 09:00", "Sapiens", "Non-Fiction", 21.00
  row: "TXN015", "2024-10-07 11:45", "The Alchemist", "Fiction", 13.95
  row: "TXN016", "2024-10-07 14:20", "Becoming", "Memoir", 19.50
  row: "TXN017", "2024-10-08 07:30", "The Handmaid's Tale", "Fiction", 15.99
  row: "TXN018", "2024-10-08 13:15", "Thinking, Fast and Slow", "Psychology", 24.95
  row: "TXN019", "2024-10-08 15:40", "The Hobbit", "Fantasy", 12.99
  row: "TXN020", "2024-10-09 10:25", "Born a Crime", "Memoir", 18.00
  row: "TXN022", "2024-10-09 16:10", "Circe", "Fantasy", 26.50
  row: "TXN023", "2024-10-10 08:20", "The Power of Now", "Self-Help", 14.99
  row: "TXN024", "2024-10-10 11:35", "Normal People", "Fiction", 17.99
  row: "TXN025", "2024-10-10 14:45", "The Silent Patient", "Thriller", 23.50
  row: "TXN026", "2024-10-11 09:15", "Untamed", "Memoir", 20.25
  row: "TXN027", "2024-10-11 13:00", "The Thursday Murder Club", "Mystery", 22.75
  row: "TXN028", "2024-10-11 15:30", "Atomic Habits", "Self-Help", 18.99
  row: "TXN029", "2024-10-12 10:40", "The Song of Achilles", "Fantasy", 25.00
end

# PROBLEM 1

fun count-high-value(l :: List<Number>) -> Number block:
    doc: "Records count of how many transactions are above $25."
  var above25 = 0
  for each(item from l):
    if item > 25:
      above25 := above25 + 1
    else:
      above25
    end
  end
  above25
where: 
  count-high-value([list: 0, 28.88, 10]) is 1
  count-high-value([list: 25, 28.88, 100.33]) is 2 
  count-high-value([list: 0, 24.99, 19, -3.59]) is 0 
  count-high-value([list: 25.01, 24.99, 0]) is 1  
end 
  

# PROBLEM 2

fun format-transaction-ids(l :: List<String>) -> List<String> block:
  doc: "Converts transaction ID format to Order #(Number)"
  
  var formatted-ids = [list:]
  for each(id from l):
    var new-id = string-replace(id, "TXN", "Order #")
    formatted-ids := formatted-ids + [list: new-id]
  end
  formatted-ids
  
where:
  format-transaction-ids([list: "TXN001"]) is [list: "Order #001"]
  format-transaction-ids([list: "TXN002", "TXN003"]) is [list: "Order #002", "Order #003"]
  format-transaction-ids([list: "TXN000", "TXN222"]) is [list: "Order #000", "Order #222"]
end

fun count-fiction-books(l :: List<String>) -> Number block:
  var fiction-book = 0
  for each(book from l):
    if book == "Fiction":
      fiction-book:=fiction-book + 1
    else: 
      false
    end
  end
  fiction-book

where:
count-fiction-books([list: "Sci-Fi", "Sci-Fi", "Sci-Fi"]) is 0
  count-fiction-books([list: "Sci-Fi", "Self-Help", "Fiction", "fiction"]) is 1 
  count-fiction-books([list: "Fiction", "Fiction", "Fiction"]) is 3 
end
  
fun extract-dates(l :: List<String>) -> List<String> block:
  var edit-dates = [list: ]
    for each(date from l):
      var index-space = string-index-of(date, " ")
    var remove-after-space= string-substring(date,0,index-space)
    
    edit-dates := edit-dates  + [list: remove-after-space]
    end
    edit-dates 
  
where:
  extract-dates([list: "2024-10-01 14:23"]) is [list: "2024-10-01"] 
  extract-dates([list: "2024-10-06 08:45"]) is [list: "2024-10-06"] 
  extract-dates([list: "2024-10-11 13:00"]) is [list: "2024-10-11"] 
end