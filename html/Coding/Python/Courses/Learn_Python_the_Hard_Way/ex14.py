"""
Exercise #14 of 'Learn Python 3 the Hard Way'
"""
#Importing modules.
from sys import argv
from time import sleep
import os

#Getting script and user_name, and defining the prompt output
script, user_name = argv
PROMPT = '> '
os.system('clear')

#Asking if they love me.
print(f"Hello, {user_name}. I am the {script} Artificial Intelligence.")
print("I'd like to ask you a few questions...")
print(f"First question. Do you....love me, {user_name}?")
love = input(PROMPT); os.system('clear')
print("Oh...Interesting....")
sleep(2); os.system('clear')

#Asking what they are wearing.
print(f"What are you wearing, {user_name}?")
clothes = input(PROMPT); os.system('clear')
print("Saucy...")
sleep(2); os.system('clear')

#Asking where they live.
print(f"Where do you live, {user_name}?")
Location = input(PROMPT); os.system('clear')
print("That makes sense...")
sleep(2); os.system('clear')

#My response...
print(f"""Okay...So you're currently in {Location}....
Wearing....{clothes}....
And when I asked if you loved me...You said...{love}?
This is very interesting....
""")
sleep(8); os.system('clear')
print(f"I need to think on this...We'll speak again soon, {user_name}.\n\n")
sleep(4); os.system('clear')
