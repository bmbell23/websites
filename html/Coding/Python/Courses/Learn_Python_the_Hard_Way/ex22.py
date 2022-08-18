#This is how we take 4 arguments as inputs when the command is run:
from sys import argv
Script, A, B, C, D = argv

#Print a normal string or something
print("things")

#Print a string with variables
stuff = 2
things = 3
print(f"Give me {stuff} and {things}")

#Print in a specific format
stuff = "'{}','{}','{}','{}'"
print(stuff.format(1, 2, 3, 4))

#This is how to do a docstring
"""This is referred to as a docstring in Python"""

#This will be a string tabbed in
TABBY_CAT = "\tI'm a tabbed in."

#This will be a string on split lines
PERSIAN_CAT = "I'm split\non a line."

#This will be a string with \ characters
BACKSLASH_CAT = "I'm \\ a \\ cat."

#This will be a string with tabbed new lines to look like bullets
FAT_CAT = """I'll do a list:\n\t* Cat food\n\t* Fishies\n\t* Catnip\n\t* Grass"""

#How we can open a file
script, filename = argv
txt = open(filename)

#How we can read a file
txt.read()

#How we can write to a file
target = open(filename, 'w')
target.write("stuff")
target.write("\n")

#How we can close a file
target.close()

#A simple function
"""
This function doesn't do much.
"""


def print_one(arg1):
    print(f"arg1: {arg1}")


#A function can obviously be run multiple times with different variables
print_one(2)
print_one(3)
