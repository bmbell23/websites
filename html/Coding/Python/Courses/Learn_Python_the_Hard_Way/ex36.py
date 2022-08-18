from os     import system
from time   import sleep
import sys
sys.path.insert(0,'./../Modules')

system('clear')

import prompts
from prompts import prompt_name
import rooms
from rooms import room_zombies

"""
################################################
Introduction to the Story.
################################################
"""
prompt_name()
print(f"""Hello, {prompts.name}...You don't remember how you got here...
but you are starting to wake up and take a look around...""")
sleep(5)

room_zombies()

