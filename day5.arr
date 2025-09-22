use context dcic2024

fun choose-hat(temp-in-F :: Number) -> String:
  doc: "determines appropriate head gear, with above 80F a sun hat, below nothing"
  if temp-in-F >= 80:
    "sun hat"
  else:
    "no hat"
  end
where:
  choose-hat(50) is "no hat"
  choose-hat(85) is "sun hat"
  choose-hat(80) is "sun hat"
end

  


fun add-shipping(x :: Number) -> Number:
  if x >= 10:
    x + 8
  else:
    x + 4
  end
    end


fun pen(x :: Number) -> Number:
  x * 3
end



fun total( x :: Number, y :: String) -> String:
  num-to-string(add-shipping(pen(x))) + "$"
  
end