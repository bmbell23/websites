"""Using Variables in a String"""

#Using variables inside a string
first_name = "brandon"
last_name = "bell"
full_name = f"{first_name} {last_name}"

#Either way to print the "full name" works just fine
print(full_name)
print(f"{first_name} {last_name}")

#f-strings can also be used to compose a message with variables inside and assign the whole thing to a variable
message = f"Hello, {full_name.title()}" #.title() capitalizes first letters
print(message)

"""Stripping White Space"""

#Excess white space at the end of a string is really not good
bad = "python    "
print(f"{bad} is {len(bad)} characters.")

good = bad.rstrip()
print(f"{good} is {len(good)} characters.")

