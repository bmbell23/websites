from os     import system
from time   import sleep
import sys


system('clear')

def dict_key(dictionary, value):
    for key, index in dictionary:
        if index == value:
            return key

#create a dictionary with properties about a person
brandon = {'name':'brandon','age':'33','height':int(5)*12+int(11)}
brandon['city'] = 'colorado springs'

#create a dictionary of states
states = {
    'OR':'Oregon',
    'CO':'Colorado',
    'CA':'California',
    'NY':'New York',
    'MI':'Michigan',
    'FL':'Florida'
}

#create a dictionary of cities
cities = {
    'CA':'San Francisco',
    'CO':'Denver',
    'MI':'Detroit',
    'FL':'Jacksonville'
}

letters = {
    1:'A',
    2:'B',
    3:'C',
    4:'D'
}

symbols = {
    'A':'Alpha',
    'B':'Beta',
    'C':'Gamma',
    'D':'Delta'
}

#add some more cities
cities['NY'] = 'Buffalo'
cities['OR'] = 'Springfield'

print('- ' * 20)
for key, val in list(brandon.items()):
    print(f"{key} is {val}.")
print('- ' * 20)
print('\n')

#print out some cities
print('- ' * 20)
print(f"The capital of {states['CO']} is {cities['CO']}, CO.")
print(f"The capital of {states['MI']} is {cities['MI']}, MI.")
print('- ' * 20)
print('\n')

#reference nested dictionaries
print('- ' * 20)
print(f"Greek letters are great. Especially {symbols[letters[1]]}.")
print('- ' * 20)
print('\n')

#loop through a dictionary
print('- ' * 20)
for state, names in list(states.items()):
    print(f"{state} is the abbreviation for {names}.")
print('- ' * 20)
print('\n')

#loop through another dictionary
print('- ' * 20)
for state, names in list(cities.items()):
    print(f"{names} is in {state}.")
print('- ' * 20)

#safely get a state by abbreviationh that might not be there
state = states.get('Texas')

if not state:
    print("Sorry, no Texas")

#get a city with a default value
city = cities.get('TX', 'Does not exist')
print(f"the abbreviation for 'Texas' is: {city}")