use context dcic2024

data Vehicle:
  | bike 
  | Car( make :: String, Year :: Number)
  |Truck( make :: String, Year :: Number, Capacity :: Number)
end

fun vehicle-age(x :: Vehicle, current-year :: Number) -> Number:
  cases(Vehicle)x:
    | bike => 0
    |Car(make,Year) => current-year - Year
    |Truck(make,Year,capacity) => current-year - Year
  end
end

