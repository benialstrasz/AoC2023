import numpy as np

t = np.array([41,96,88,94]) # times
d = np.array([214,1789,1127,1055]) # distances

tt = np.array([7,15,30]) # test times
td = np.array([9,40,200]) #test distances

raceArray = np.array([])

# equations:
#        v = holdTime * 1mm / mm    #linear acceleration, 1mm and mm is unity => v = holdTime
#        d = v * (t_tot - holdTime)

for i, time in enumerate(t):
    waysToWinThisRace = 0
    for holdTime in range(time):
        raceDistance = holdTime * (t[i] - holdTime)
        #print(f'Race distance: {raceDistance}')
        #print(f'distance to beat: {d[i]}')
        if raceDistance > d[i]:
            waysToWinThisRace += 1
            #print(f'rD > tdi. waysToWinThisRace = {waysToWinThisRace}')
    #print(f'appending {waysToWinThisRace} to raceArray: {raceArray}')
    raceArray = np.append(raceArray, waysToWinThisRace)

print(f'raceArray: {raceArray}')

result = np.prod(raceArray)
print(f'Product of all the elements is {result}')

##########
# PART 2 #
##########

t2 = 41968894
d2 = 214178911271055

waysToWinThisRace = 0
for holdTime in range(t2):
    raceDistance = holdTime * (t2 - holdTime)
    if raceDistance > d2:
        waysToWinThisRace += 1

print(f'Part 2: #ways to win the race: {waysToWinThisRace}')