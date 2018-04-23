file = open("test.txt", "r")
msg = file.read().split('|')

container = msg[0]
quantity = msg[1]

print("Container: " + container)
print("Quantity: " + quantity)
