from os     import system
from sys    import exit

system('clear')

"""
##########################################
What happens at the beginning
##########################################
"""
def start():
    print("""Welcome to a dark cold room.\nThere are two doors...
1. Choose Door #1
2. Choose Door #2""")

    choice = input("> ")

    if "1" in choice:
        bear_room()
    elif "2" in choice:
        gold_room()
    else:
        dead("You walk around aimlessly forever and die of lonliness...")


"""
##########################################
What happens when you die
##########################################
"""
def dead(reason):
    print(reason, "You'll be missed.\n\n")
    exit(0)

"""
##########################################
What happens in the Gold Room
##########################################
"""
def gold_room():
    print("\nThis room is full of gold bars. How many do you take?")

    choice = input("> ")
    if ("0" in choice) or ("1" in choice):
        quantity = int(choice)
    else:
        dead("A mathematician attacks you for not knowing what a number is. You die.")

    if quantity < 50:
        print("Nice, you're not too greedy.")
        exit(0)
    else:
        dead("Too greedy! A walrus murders you. Rest in Peace.")

"""
##########################################
What happens in the bear room
##########################################
"""
def bear_room():
    print("""\nThis room is full of bears.\nThey all have honey.\nWhat do you do?""")
    bear_moved = False

    while True:
        print("\n1. Taunt the bears\n2. Take their honey\n3. Look for a way out")
        choice = input("> ")

        if choice == "2":
            dead("The bears maul you long before you get to the honey. Rest in Peace.")

        elif choice == "1" and not bear_moved:
            print("The bear crawls away from a hidden door.\nYou walk through the door.")
            bear_moved = True
        elif choice == "1" and bear_moved:
                dead("The bear kills you. Rest in Peace.")
        elif choice == "3" and bear_moved:
                gold_room()
        else:
            print(f"What is '{choice}' supposed to mean?")

"""
##########################################
What happens in the void
##########################################
"""
def void():
    print("\nYou see a mirror of yourself looking at a mirror of yourself.\nWhat do you do?")
    choice = input("> ")

    if "flee" in choice:
        start()
    elif "head" in choice:
        dead("The void destroys you....")

start()