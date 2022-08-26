import os
os.system('cls')


def add(a, b):
    print(f"Adding {a}+{b}.")
    return a+b


def sub(a, b):
    print(f"Subtracting {a}-{b}.")
    return a-b


def mul(a, b):
    print(f"Multiplyng {a}*{b}.")
    return a*b


def div(a, b):
    print(f"Dividing {a}/{b}.")
    return a/b


print("Let's do some math with just functions!")

age = add(30, 5)
height = sub(78, 4)
weight = mul(90, 2)
iq = div(100, 2)

print(f"Age: {age}, Height: {height}, Weight: {weight}, IQ: {iq}")

#A puzzle for the extra credit, type it in anyay:
print("Here is a puzzle.")

what = add(age, sub(height, mul(weight, div(iq, 2))))

print("That becomes:", what, "Can you do it by hand?")
