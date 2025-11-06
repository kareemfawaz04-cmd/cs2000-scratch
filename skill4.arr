use context dcic2024

# Design a data definition for Restaurant that can be either yahoo with name and stars, or health-score with name and score. Then, write a function is-reputable that returns true if the resturant is a yahoo with at least 4 stars, or a health-score with score at least 85.


data Restaurant:
  | yahoo(name :: String, stars :: Number)
  | health-score(name :: String, score :: Number)
end

rest1 = yahoo("in-n-out", 4)
rest2 = yahoo("poke-stop", 5)
rest3 = health-score("Zuma", 90)
rest4 = health-score("subway", 70)

fun is-reputable(r :: Restaurant) -> Boolean:
  cases (Restaurant) r:
    | yahoo(n, s) => s >= 4
    | health-score(n, sc) => sc >= 85
  end
where:
  is-reputable(rest1) is true
  is-reputable(rest2) is true
  is-reputable(rest3) is true
  is-reputable(rest4) is false
end


# Design a data definition for Book that can be either rating with title, stars, and num-reviews, or sales-ranking with title and position. Then, write a function is-popular that returns true if the book is a rating with num-reviews of at least 500, or a sales-ranking with position less than 500.

data Book:
  |rating(title :: String, stars :: Number, num-reviews :: Number)
  |sales-ranking( title :: String, position :: Number)
end
b1= rating("squirt", 5,500)
b2=rating("bust", 6,1134)
b3=sales-ranking("top",100000)
b4=sales-ranking("bottom",456)

fun is-popular(b :: Book)-> Boolean:
  cases (Book) b:
    |rating(n,s,nr)=> nr >= 500
    |sales-ranking(n,p)=> p >= 500
  end
where:
  is-popular(b1) is true
  is-popular(b2) is true
  is-popular(b3) is true
  is-popular(b4) is false
end



# Prompt:
# Design a data definition for Show that can be either movie with title and duration (in minutes), or series with title and number of seasons.
# Then, write a function is-long that returns true if the movie is longer than 120 minutes, or the series has at least 5 seasons.

# Variation idea:
# Add a third type later (like documentary with topic and rating), and update your is-long function.

data show:
  |movie(title :: String, duration :: Number)
  |series(title:: String, seasons :: Number)
end

fun is-long(r :: show)->Boolean:
  doc:"if the movie is more than 120 the output is true or if the series is longer than five seasons then true"
  cases (show) r:
    |movie(t,d) => d > 120
    |series(t,s) => s >= 5
  end
where:
  mov1= movie("maze runner",140)
  mov2= movie("dare",110)
  ser1= series("rick n morty" , 7)
  ser2= series("got" , 4)
      
  is-long(mov1) is true
  is-long(mov2) is false
  is-long(ser1) is true
  is-long(ser2) is false
end


# Design a data definition for Job that can be either

# engineer with salary,

# teacher with experience, or

# artist with portfolio-size.
# Write a function is-stable that returns true if salary ≥ 80000, experience ≥ 5 years, or portfolio-size ≥ 15.

data Job:
  |engineer( salary :: Number)
  |teacher( experience:: Number)
  |artist( portfolio-size:: Number)
end

fun is-stable(j :: Job) -> Boolean:
  cases (Job) j:
    |engineer(s)=> s >= 80000
    |teacher(e)=> e >= 5
    |artist(ps)=> ps >= 15
  end
where:
  eng1 = engineer(90000)
  eng2 = engineer( 70000)
  teach1 = teacher( 6)
  teach2 = teacher( 4)
  art1 = artist(20)
  art2 = artist( 10 )
  
  is-stable(eng1) is true
  is-stable(eng2) is false
  is-stable(teach1) is true
  is-stable(teach2) is false
  is-stable(art1) is true
  is-stable(art2) is false
end

  