from decimal import ROUND_DOWN
import os
os.system('cls')


def cheese_and_crackers(cheese_count, boxes_of_crackers):
    print(f"You have {cheese_count} cheeses!")
    print(f"You have {boxes_of_crackers} boxes of crackers!")
    print("Man that's enough for a party!")
    print("Get a blanket.\n")


#Calling our function on the inputs 20 and 30:
print("We can just give the function numbers directly:")
cheese_and_crackers(20, 30)

#Calling our function on the inputs 10 and 50:
print("...or we can use variables from our script:")
amount_of_cheese = 10
amount_of_crackers = 50
cheese_and_crackers(amount_of_cheese, amount_of_crackers)

#Calling our function on the inputs 10+20 and 5+6:
print("We can even do math inside too:")
cheese_and_crackers(10+20, 5+6)

#Calling our function on some wild shenanigans:
print("And we can combine the two...variables and math!")
cheese_and_crackers(amount_of_cheese+100, amount_of_crackers+10000)

# print(amount_of_cheese)


def party_mode(waffles, pancakes):
    print(f"You have {waffles * 394209} waffles.")
    print(f"You have {pancakes / 29} pancakes.")
    print(f"You have {waffles*pancakes} happy people.")


print("Who wants breakfast?:")
party_mode(10, 20)
