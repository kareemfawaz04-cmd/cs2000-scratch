use context dcic2024
shuttle = table: month :: String, rider
  row: "jan", 2000
  row: "feb", 3333
  row: "mar", 5555
  row: "apr", 1000
  row: "may", 23
  row: "jun", 357
end


fun ode(r :: Row)-> Boolean:
  if r["rider"] >= 1000:
    true
  else:
    false
  end
  where:
  ode(shuttle.row-n(2)) is true
  ode(shuttle.row-n(5)) is false
end



# when running
#- high-shuttle-ridership =filter-with(shuttle,ode)
# - filter-with(shuttle,ode)
#- order-by(high-shuttle-ridership,"rider",true)
#- order-by(high-shuttle-ridership,"rider",false)

# when running-> 
# filter-with(shuttle,lam(r): r["rider"] >= 1000 end)
# this basically runs a function without having to write it before calling it. in a way a shortcut to do when running) 





