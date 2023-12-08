class Coord:
    def __init__(self, name, instrL, instrR):
        self.name = name
        self.instrL = instrL
        self.instrR = instrR

def parseLine(line):
    parts = line.strip().split(" = ")
    name = parts[0]
    instrL, instrR = map(str.strip, parts[1][1:-1].split(','))
    return Coord(name, instrL, instrR)

def read_input_file():
    with open('input.txt', 'r') as file:
        lines = file.readlines()
        coords = [parseLine(line) for line in lines]
    return coords

testInstructions = "LLR"
instructions = "LLRLRRLLRLRRLLRLRRLRRRLRLRLRRRLLRLRRRLRLRRRLRLRLLLRRLRLRLLRLRRLRRRLRRRLLRRLRLRRRLRRLRRRLRLLRRLRRRLRRRLRRLRLRRLLLRLRLLRRRLRRLLRLRLRRLLRLRRLLRLRRLRRLLRRRLRLRLRRRLLRRRLRRLRRRLRRRLRLRRRLRRLLLRRRLRLLLRRRLRLLRLLRRRLLRRLRRRLRRRLRLLRLRLRRRLLRRLRRRLRRLRLLRRRLRRLRRRLRRRLRRRLRLRRRLRRRLRLRRRR"

coords = read_input_file()

isZZZfound = False 
numberOfSteps = 0
currentLocation = "AAA" # we start with the AAA element (it's not in line 1)

while not isZZZfound:
    for element in instructions: #loop over all LR elements in instructions 
        #print(f'instruction: {element} ; current location: {currentLocation}')
        for coord in coords: #search for the right element in all [coords]
            if coord.name == currentLocation:
                if element == "L":
                    currentLocation = coord.instrL
                    #print(f'current location: {currentLocation}')
                    numberOfSteps += 1
                elif element == "R":
                    currentLocation = coord.instrR
                    #print(f'current location: {currentLocation}')
                    numberOfSteps += 1
                break #coordinate found; go to the next element in LR instucrions 
        if currentLocation == "ZZZ":
            isZZZfound = True #end found; end while loop

print(f'Number of steps it took to reach ZZZ: {numberOfSteps}')

