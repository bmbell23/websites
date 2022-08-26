"""
Section 05: Python Statements!
"""
#Section 5.1: If, Elif, and Else
hungry = False
if hungry:
    print("I'm starving! Feed me!")
else:
    print("I'm not hungry right now.")

location = 'Auto Shop'
if location == 'Auto Shop':
    print('cars are neat')
elif location == 'bank':
    print('money is cool')
elif location == 'store':
    print('food is cool')
else:
    print('where am i?')

name = 'sammy'
if name == 'franky':
    print("Hello Franky!")
elif name == 'sammy':
    print("Hello Sammy!")
else:
    print("What is your name?")
