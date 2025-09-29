use context dcic2024


temp =
  table: date,tempur, humidity
    row: "2025-25-03",  15, 0.3
    row: "2025-13-07",  "45",3
    row: "2025-04-05",  18, 0.2
    row: "2025-30-04",  18, 0
  end


fun clean-temp( x )-> Number:
  if is-string(x):
    string-to-number(x).or-else(0)
    else:
    x
  end
    
where:
  clean-temp(45) is 45
  clean-temp(15) is 15
  clean-temp(18) is 18
  clean-temp(18) is 18
  clean-temp("45") is 45
end
  clear_weather=transform-column(temp,"tempur",clean-temp)

fun wetness(r :: Row) -> String:
  if r["humidity"] == 0:
    "dry"
  else if r["humidity"] < 1:
    "drizzly"
  else:
    "wet"
  end
where:
  wetness(temp.row-n(0)) is "drizzly"   # first row has humidity 0.3
  wetness(temp.row-n(3)) is "dry"       # fourth row has humidity 0
  wetness(temp.row-n(1)) is "wet"       # second row has humidity 3
end

