from os     import system
from time   import sleep
import sys

system('clear')


"""
################################################
Doing Things with lists
- appending items to a list with a while loop
- popping items from a list
- joining items from a list in different ways
################################################
"""

ten_things = "apples, oranges, crows, teleophone, light, sugar"

print("Wait...there are not 10 things in that last, one moment\n")

stuff = ten_things.split(' ')
more_stuff = ["day", "night", "song", "frisbee", "corn", "banana", "girl", "boy"]

while len(stuff) != 10:
    next_one = more_stuff.pop()
    print(f"Adding {next_one} to the list.")
    stuff.append(next_one)
    print(f"There are now {len(stuff)} items in the list:\n")
    print(''.join(stuff))

print(f"I fixed your list to have 10 items!\nYour new list is:\n{stuff}.")

print(stuff[1])
print(stuff[-1])
print(stuff.pop())
print('\n'.join(stuff))
print('#'.join(stuff[3:5]))
print(''.join(ten_things))