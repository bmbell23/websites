"""
Exercise #15 of 'Learn Python 3 the Hard Way'
"""
#Importing modules.
from sys import argv
script, filename = argv
import os; os.system('cls')
from sys import argv

# open the file
txt = open(filename)

# print the file
print(f""""Your filename is {filename}:
The contents of the file is shown below:""")
print(txt.read())

# enter filename again
print(f"Please type the filename again:")
file_again = input("> ")

# print filename again
txt_again = open(file_again)
print(txt_again.read())
