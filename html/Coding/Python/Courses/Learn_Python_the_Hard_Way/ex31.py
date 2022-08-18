import os

os.system('clear')

print("You enter a dark room with two doors...Do you go through Door #1 or Door #2?")

door = input("> ")

if door == "1":
    print("""There is a giant bear here eating cheesecake. What do you do?
1.) Take the cheesecake.
2.) Scream at the bear.""")
    door1 = input("> ")

    if door1 == "1":
        print("The bear rips your intestines out and you die.")
    elif door1 == "2":
        print("The bear screams back and you die.")
    else:
        print(f"You die because {door1} was dumb.")

elif door == "2":
    print("""There is a deep sea of nothingness. What do you do?
1.) Fire a magic missle into the void.
2.) Jump into the black abyss and hope for the best.""")
    door2 = input("> ")

    if door2 == "1":
        print("The missle hits you and you die.")
    elif door2 == "2":
        print("You fall int a hole and you die.")
    else:
        print(f"You die because {door2} was dumb.")

else:
    print(f"You die because {door} was not an option.")

print("\n")