#Section 5.2: For Loops

import os
os.system('cls')

numlist = [0,1,2,3,4,5,6,7,8,9]

"Simple for loop to multiply"
# print("Here are your numbers squared:")
# for num in numlist:
#     print(num * num)

"Checking for even numbers"
# print("Here are your even numbers:")
# for num in numlist:
#     #check if number is even:
#     if num % 2 == 0:
#         print(f'Even Number: {num}')
#     else:
#         print(f'Odd Number: {num}')

"Doing math with the current list and a new list"
# list_sum = 0
# print("Here is a sum of each number")
# for num in numlist:
#     list_sum_old = list_sum
#     list_sum = list_sum + num
#     print(f'{list_sum_old} plus {num} equals {list_sum}')

"For list with a string"
# for let in 'hello world':
#     print(let)
# for _ in 'hello world':
#     print('let')

"For list with a Tuple"
# tup = (1,2,3)
# for item in tup:
#     print(item)

"For list with a set of Tuples"
# tupset = [(1,2),(3,4),(5,6),(7,8)]
# print(f'The set has a total of {len(tupset)} tuples in it:')
# for _ in tupset:
#     print(_)

"Here we can 'unpack' our tuples"
# for a,b in tupset:
#     print(f'The first value in the tuple is {a}.')

"For list with a dictionary"
d = {'k1':1,'k2':2,'k3':3}
for item in d:
    print(item)
for item,value in d.items():
    print(value)
