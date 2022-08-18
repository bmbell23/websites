import os
os.system('clear')

the_count = [1, 2, 3, 4, 5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

#this first kind of for-loops goes through a list
for number in the_count:
    print(f"The count is {number}")

#similarly
for fruit in fruits:
    print(f"{fruit} are a fruit.")

#we can also do mixed lists, notce we have to use {} since we dont know whats in it
for _ in change:
    print(f"I have {_}")

#we can also build lists, first start with an empty one:
elements = []

#then use the range function to do 0 to 5 counts
for _ in range (0,6):
    print(f"Adding {_} to the list.")
    #append is a function that lists understand:
    elements.append(_)

#now we can print them too:
for i in elements:
    print(f"The element was {i}.")
