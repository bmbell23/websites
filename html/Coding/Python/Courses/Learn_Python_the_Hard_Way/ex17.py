"""
Exercise #17 of 'Learn Python 3 the Hard Way'
"""

#TO RUN THIS SCRIPT TYPE:
    #py3 17.py test1.txt test2.txt

#importing modules
from sys import argv
from os.path import exists
from time import sleep
import os; os.system('clear')

#defining variables
script, from_file, to_file = argv

#printing the files used
print(f"Copying from {from_file} to {to_file}...")
sleep(1)
os.system('clear')

#defining the in_file
in_file = open(from_file); indata = in_file.read()

#length of the input file
print(f"The input file is {len(indata)} characters")

#output file check
print(f"Does the output file exist? {exists(to_file)}")
print("Read, hit ENTER to continue or ctrl+C to abort.")
input("> ")

#writing data to the new file
out_file = open(to_file, 'w')
out_file.write(indata)

print("Copy complete.")

out_file.close()
in_file.close()
