fun tip-amount(x :: Number, y :: Number) -> Number:
  doc: "takes the amount given and calculates the tip amount%"
  
  if (x < 0) or (x > 100) or (y < 0) or (y > 100) :
    raise("Invalid input, try again")
  else:
    (x * y) / 100
  end
    
end
fun calculate-tip(x :: Number, y :: Number) -> Number:
  doc: "takes amount and adds the tip amount"
  (x + tip-amount(x,y))

where:
  calculate-tip(100,2) is 102
  calculate-tip(0,2) is 0
  calculate-tip(-1,-1) raises ("Invalid input, try again")
end
