"""
Exercise #12 of 'Learn Python 3 the Hard Way'
"""

Age = input("How old are you in years? ")
Inches = float(input("How tall are you in inches? "))
Lbs = float(input("How much do you weigh in lbs? "))

Kg = float(0.453592 * Lbs)
Meters = float(0.0254 * Inches)

Bmi = round((Kg / (Meters * Meters)), 2)

print(f"So, you're {Age} years old, {Inches} inches tall, and {Lbs} pounds.")
print(f"Your BMI is {Bmi}")
