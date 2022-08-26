from sys import exit
from random import randint
from textwrap import dedent



class Scene():

    def enter(self):
        print("This scene is not yet configured")
        exit(1)



class GameEngine():
    def __init__(self, scene_map):
        self.scene_map = scene_map

    def play(self):
        current_scene = self.scene_map.opening_scene()
        last_scene = self.scene_map.next_scene('finished')

        while current_scene != last_scene:
            next_scene_name = current_scene.enter()
            current_scene = self.scene_map.next_scene(next_scene_name)

        #be sure to print out the last scene
        current_scene.enter()



class Death(Scene):

    quips = [
        "You are a complete failure at life.",
        "Hahah you suck.",
        "You died you idiot loser.",
        "You win!!! ... At nothing. You're dead.",
        "You suck at this, bro. Give up.",
        "#dead-life #so-dead #give-up",
        "LOL u R b4d dUd3."
    ]

    def enter(self):
        print(Death.quips[randint(0, len(self.quips)-1)])
        exit(1)



class CentralCorridor(Scene):

    def enter(self):
        print(dedent("""
                    You're runing down the central corridor and run into a
                    parrot. He's big and he's about to kill you.
                     """))

        action = input("> ")

        if action == "shoot!":
            print(dedent("""
                         You shoot. You die.
                         """))
            return 'death'

        elif action == "dodge!":
            print(dedent("""
                         You dodge. You die.
                         """))
            return 'death'

        elif action == "tell a joke":
            print(dedent("""
                         You tell a joke. You are lucky and find a new door.
                         """))
            return 'laser_weapon_armory'

        else:
            print("DOES NOT COMPUTE!")
            return 'central_corridor'



class LaserWeaponArmory(Scene):

    def enter(self):
        print(dedent("""
                     You do some stuff need to guess a 3 digit code.
                     """))
        code = f"{randint(1,9)}{randint(1,9)}{randint(1,9)}"
        guess = input("[keypad]> ")
        guesses = 0


        while guess != code and guesses < 9:
            print(f"{guess} is invalid. Try again.")
            guesses += 1
            guess = input("[keypad]> ")


        if guess == code:
            print(dedent("""
                         Good job, you did it.
                         """))
            return 'the_bridge'

        else:
            print(dedent("""
                         You die.
                         """))
            return 'death'



class TheBridge(Scene):

    def enter(self):
            print(dedent("""
                         You end up on the Bridge with a Bomb.
                         What do you do?
                         """))

            action = input("> ")

            if action == 'throw it':
                print(dedent("""
                             You panic and throw it.
                             You die.
                             """
                             ))
                return 'death'

            if action == 'gently set it down':
                print(dedent("""
                             You gently place it down and run.
                             """))
                return 'escape_pod'

            else:
                print("Try again.")
                return 'the_bridge'


class EscapePod(Scene):

    def enter(self):
        print(dedent("""
                     You find 5 escape pods to return to Earth.
                     Which one do you take?
                     """))

        good_pod = randint(1,5)
        pod_guess = input("> ")

        if int(pod_guess) != good_pod:
            print(dedent("""
                         You hop in and die.
                         """))
            return 'death'

        else:
            print(dedent("""
                         You get back to Earth and win.
                         """))
            return 'finished'


class Finished(Scene):

    def enter(self):
        print(dedent("""
                     You get back to Earth and everyone loves you.
                     """))
        return 'finished'



class Map():

    scenes = {
        'central_corridor'      : CentralCorridor(),
        'death'                 : Death(),
        'escape_pod'            : EscapePod(),
        'finished'              : Finished(),
        'laser_weapon_armory'   : LaserWeaponArmory(),
        'the_bridge'            : TheBridge(),
    }


    def __init__(self, start_scene):
        self.start_scene = start_scene

    def next_scene(self, scene_name):
        val = Map.scenes.get(scene_name)
        return val

    def opening_scene(self):
        return self.next_scene(self.start_scene)



a_map = Map('central_corridor')
a_game = GameEngine(a_map)
a_game.play()