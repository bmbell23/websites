from os     import system
from sys    import exit
from time   import sleep

system('clear')

"""
################################################
This is a room full of zombies that must be escaped.
################################################
"""
def room_zombies():
    system('clear')
    print("""You are in a room full of flesh eating zombies. They all look at you instantly and start
bolting towards you. This is really bad. What do you do?\n
Type 'A' to pull out a machine gun and start spraying bullets.
Type 'B' to turn around and start running.
Type 'C' to check your inventory.\n""")
    response1 = input()

    if "A" in response1:
        print(""""\nBullets go flying and you shoot down a few, but they keep coming.
Some of them are really getting close now, and you're quickly running out of bullets.
What do you do?\n
Type 'A' to start ramming through them while holding your gun in front of you like a battering ram.
Type 'B' to break through a window you see on your left.
Type 'C' to use the last of your bullets trying to break through the door behind you.
""")
        response2 = input()

        if "A" in response2:
            print("You made it through the pack but fell into a deep hole you didn't see coming...")
            sleep(3)

        elif "B" in response2:
            print("You break through the window, but quickly fall down to the floor below, still inside...")
            sleep(3)

        elif "C" in response2:
            print("You ")


    elif "B" in response1:
        print("You quickly realize the door you came in from is locked. Oh dear.")

    elif "C" in response1:
        print("It's empty. Oh no...")

    else:
        print("I don't understand...Try agian.")
        sleep(2)
        room_zombies()

"""
################################################

################################################
"""


"""
################################################

################################################
"""


"""
################################################

################################################
"""


"""
################################################

################################################
"""


"""
################################################

################################################
"""