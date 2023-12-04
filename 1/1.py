import numpy as np
import re # das package cha sache usefiutere hani ergooglet.

with open('input.txt') as f:
    input = f.read().splitlines() #das list line für line und macht grad ä array, und es löscht oh grad aui "\n" new line characters use
    # iz isch input ä array vo Strings

for idx, line in enumerate(input):
    input[idx] = re.sub("[^0-9]", "", line) #aui buechstabe uselösche
    if len(input[idx]) == 1:
        input[idx] = input[idx] + input[idx] #wes nume ei Zahl isch die verdopple (isch im rätsu so gä)
    elif len(input[idx]) > 2:
        input[idx] = input[idx][0] + input[idx][-1] #wes meh aus 2 zahle si de nume di erschti u di letschi nä
    input[idx] = int(input[idx]) # string zu integer umwandle

sum = np.sum(input)
print(f'Sum of all the elements is {sum}')
