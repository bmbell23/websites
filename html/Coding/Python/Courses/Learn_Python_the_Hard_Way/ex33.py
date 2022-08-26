import os
from time import sleep
from sys import argv
os.system('clear')

number = input("What number should I count to?\n")
print("> ")

def count(num):
    os.system('clear')
    print(f"I'm counting to {num}:\n")
    full_list = []
    i = 1
    list = [i]
    while i <= num:
        print(f"{i}...")
        list.append(i)
        sleep(1)
        full_list.append(i)
        i = i + 1
    print(f"\nI'm done! The full list of numbers is:\n{full_list}\n\nGoodbye!\n")

count(int(number))
