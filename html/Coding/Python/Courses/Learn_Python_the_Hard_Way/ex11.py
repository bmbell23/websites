"""
Exercise #11 of 'Learn Python 3 the Hard Way'
"""
print("How old are you in years?", end=' ')
AGE = input()
print("How tall are you in inches?", end=' ')
INCHES = float(input())
print("How much do you weigh in lbs?", end=' ')
LBS = float(input())

KG = float(0.453592 * LBS)
METERS = float(0.0254 * INCHES)

BMI = round((KG / (METERS * METERS)), 2)

print(f"So, you're {AGE} years old, {INCHES} inches tall, and {LBS} pounds.")
print(f"Your BMI is {BMI}")
