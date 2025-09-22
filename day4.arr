use context dcic2024
fun hello(name :: String) -> String:
  doc:"takes a string as a inputand provides a greeting message as output"
  "Welcome to class, " + name
end

fun hey(name):
  "Welcome to class, " + name
end



#class

layer1= rectangle(40,20,"solid","white")
layer2= rectangle(40,20,"solid","pink")
layer3= rectangle(40,20,"solid","brown")

cake=above(above(layer1,layer2),layer3)


fun three-layer-cake(flavour1 :: String, flavour2 :: String, flavour3 :: String) -> Image:
  l1 = rectangle(40,20,"solid",flavour1)
  l2 = rectangle(40,20,"solid",flavour2)
  l3 = rectangle(40,20,"solid",flavour3)
   above(above(l1, l2), l3) 
end
# fun three-layer-cake(flavour1, flavour2, flavour3):
#   l1 = rectangle(40,20,"solid",flavour1)
#   l2 = rectangle(40,20,"solid",flavour2)
#   l3 = rectangle(40,20,"solid",flavour3)
#   above(above(l1, l2), l3)
# end

four_shirts= (4 * (5 + (0.10 * string-length("Go Team"))))

seven_shirts= (7 * (5 + (0.10 * string-length("Hello world"))))


fun tshirts_cost(x :: Number) -> Number:
  (x * (5 + (0.10 * string-length("Hello world")))) 
end


  
