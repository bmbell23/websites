"""
Exercise #16 of 'Learn Python 3 the Hard Way'
"""

#importing modules:
from sys import argv
script, filename = argv
import os
os.system('clear')

#Printing questions for the file:
print(f"We're going to erase {filename}.")
print("If you don't want that, hit ctrl+C (^C).")
print("If you do want that, press ENTER.")

#Prompting the user:
input("> ")

#Printing the result:
print("Opening the file...")
target = open(filename, 'w')

#Truncating the file (erasing the contents)
print("Truncating the file. Goodbye!")
target.truncate()

#Prompting for line input:
print("Now I'm going to ask you for three lines.")
line1 = input("line 1: ")
line2 = input("line 2: ")
line3 = input("line 3: ")

#Writing the prompted lines to the file:
print("I'm going to write these lines to the file.")
target.write(line1); target.write("\n")
target.write(line2); target.write("\n")
target.write(line3); target.write("\n")

#Confirmation of results:
print("I have written your lines and closed the file. Goodbye.")
target.close()