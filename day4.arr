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

# layer4= rectangle(40,20,"solid","red")
# layer5= rectangle(40,20,"solid","blue")
# layer6= rectangle(40,20,"solid","pink")
# three_layer_cake=above(above(layer4,layer5),layer6)
layer4=rectangle(40,20,"solid",flavour1)
layer5= rectangle(40,20,"solid",flavour2)
layer6= rectangle(40,20,"solid",flavour3)

three_layer_cake=above(above(layer4,layer5),layer6)

fun three_layer_cake(flavour1,flavour2,flavour3):
 three_layer_cake=above(above(layer4,layer5),layer6)
 end