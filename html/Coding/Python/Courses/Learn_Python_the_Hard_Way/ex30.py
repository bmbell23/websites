people = 30
cars = 40
trucks = 15

if cars > people:
    print("We should take the cars")
elif cars < people:
    print("We should not take the cars")
else:
    print("we cant decide")

if trucks > cars:
    print("too many trucks")
elif trucks < cars:
    print("take the trucks")
else:
    print("we cant decide")

if people > trucks:
    print("alright, lets take the trucks")
else:
    print("fine stay home")