use context dcic2024

use context dcic2024
include csv
include data-source
# Create a new defined data type
data BookRecord:
  | book(title :: String, author :: String, pages :: Number)
end


b1 = book("Commonwealth", "Ann Patchett", 350) # Save as definition
b2 = book("Call me by your name","Andri Aciman", 400)
b3 = book("Cry The Beloved Country", "Alan Paton", 700)


# Use . operator to access data within the data type
b3.title
b2.author
b1.pages


fun summary-string(b :: BookRecord) -> String:
  doc: "returns summary of book"
  ("Title: " + b.title) + (", Author: " + b.author) + (", Pages: " + num-to-string(b.pages))
  
where: 
  summary-string(b2) is "Title: Call me by your name, Author: Andri Aciman, Pages: 400"
  
end 

# Design a function is-long-book that returns whether or not the book has more than 350 pages.
fun is-long-book(b :: BookRecord) -> Boolean:
  doc: "Determines if the book has over 350 pages"
  if b.pages > 350:
    true
  else:
    false
  end
where: 
  is-long-book(b2) is true
  is-long-book(b1) is false
end

    
# Design a new data type for a Podcast, and based on your own knowledge figure out the fields that
# make sense to include in it.

data Podcast:
  | podcast(title :: String, speaker :: String, minutes :: Number)
end

p1 = podcast("Good Podcast", "Sargun", 30)
p2 = podcast("Great Podcast", "Another Sargun", 400)

#Design a podcast-summary that produces a string summarizing a Podcast.
fun podcast-summary(p :: Podcast) -> String:
  doc: "Provide summary of podcast."
  "Title: " + p.title + 
  ", Speaker: " + p.speaker + 
  ", Minutes: " + num-to-string(p.minutes)
  
where:
  podcast-summary(p1) is "Title: Good Podcast, Speaker: Sargun, Minutes: 30"
  podcast-summary(p2) is "Title: Great Podcast, Speaker: Another Sargun, Minutes: 400"
end 


recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end

data Recipe: #Design a Recipe data definition
  | recipe(title :: String, servings :: Number, prep-time :: Number)
end

# write a row-to-recipe function that consumes a Row from the following table 
fun row-to-recipe(r :: Row) -> Recipe:
  doc: "Converts row to recipe data type"
  t = r["title"]
  s = r["servings"]
  p = r["prep-time"]
  
  recipe(t,s,p)
where:
  row-to-recipe(recipes.row-n(0)) is recipe("Classic Pancakes", 4, 15)
  row-to-recipe(recipes.row-n(1)) is recipe("Banana Oatmeal Muffins", 12, 20) 
end 

# Add a recipe column
add-recipe-column = build-column(recipes, "recipe", row-to-recipe)