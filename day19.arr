use context dcic2024
data PaymentMethod:
  |cash
  |card(card-number :: String, card-type :: String, expiry :: String)
  |checking(account-number :: String, check-number :: Number)
end

p1 = cash
p2 = card("2344-3455-6786-0094", "credit", "09/27")
p3 = checking("7565467574", 32)

fun display-payment(some-p :: PaymentMethod) -> String:
  doc: "describe the payment method"
  cases (PaymentMethod) some-p:
    |cash => "Cash payment"
    |card(card-num, c-type, exp) => "Card payment with card " + card-num
    |checking(a, c) => "Check payment with account number " + a
  end
where:
  display-payment(p1) is "Cash payment"
  display-payment(p2) is "Card payment with card 2344-3455-6786-0094"
  display-payment(p3) is "Check payment with account number 7565467574"
end


# 3
data Grade:
  | letter(value :: String)
  | percent(value :: Number)
  | pass-fail(value :: Boolean)
end

g1 = letter("C")
g2 = letter("D")

# 4
fun grade-to-gpa(some-grade :: Grade) -> Number:
  doc: "compute the GPA"
  cases (Grade) some-grade:
    |letter(v) => 
      if v == "A": 4.0
      else if v == "B" : 3.0
      else if v == "C" : 2.0
      else if v == "D" : 1.0
      else: 0.0
      end
    |percent(v) => 
      if v >= 90: 4.0
      else if v >= 80 : 3.0
      else if v >= 70 : 2.0
      else if v >= 60 : 1.0
      else: 0.0
      end
    |pass-fail(v) => 
      if v == true: 4.0
      else: 0.0
      end
  end
where:
  grade-to-gpa(letter("A")) is 4.0
  grade-to-gpa(letter("B")) is 3.0
  grade-to-gpa(letter("C")) is 2.0
  grade-to-gpa(letter("D")) is 1.0
  grade-to-gpa(letter("F")) is 0.0
  grade-to-gpa(percent(95)) is 4.0
  grade-to-gpa(percent(90)) is 4.0
  grade-to-gpa(percent(88)) is 3.0
  grade-to-gpa(percent(80)) is 3.0
  grade-to-gpa(percent(75)) is 2.0
  grade-to-gpa(percent(70)) is 2.0
  grade-to-gpa(percent(68)) is 1.0
  grade-to-gpa(percent(60)) is 1.0
  grade-to-gpa(percent(59.8)) is 0.0
  grade-to-gpa(pass-fail(false)) is 0.0
  grade-to-gpa(pass-fail(true)) is 4.0

end