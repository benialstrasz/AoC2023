from collections import Counter

class Game:
    def __init__(self, hand, bid):
        self.hand = hand
        self.bid = int(bid)
        self.value = None
    def calculate_value(self):
        # Total value of your hand cards first considering combinations and then the values of the single cards in order. 
        self.value = handBaseStrength(self.hand) + handCardValue(self.hand)

def read_input_file():
    games = []
    with open('input.txt', 'r') as file:
        for line in file:
            hand, bid = line.strip().split()
            game = Game(hand, bid)
            games.append(game)
    return games

def cardValue(card):
    if card.isdigit():
        return int(card)
    elif card == "T":
        return 10
    elif card == "J":
        return 11
    elif card == "Q":
        return 12
    elif card == "K":
        return 13
    elif card == "A":
        return 14
    
def handBaseStrength(hand):
    strength = 0
    if len(hand) != 5:
        return 0
    x = Counter(hand)
    mcf = x.most_common()[0][1] # mostCommonFrequency
    mcc = x.most_common()[0][0] # mostCommonCard
    if mcf == 5: # Five of a kind
        strength = strength + 60000000000
    elif mcf == 4: # Four of a kind
        strength = strength + 50000000000
    elif mcf == 3:
        if x.most_common()[1][1] == 2: # Full house!
            strength = strength + 40000000000
        else: # Three of a kind
            strength = strength + 30000000000
    elif mcf == 2:
        if x.most_common()[1][1] == 2: # Two pair!
            strength = strength + 20000000000
        else: # one pair
            strength = strength + 10000000000
    return strength

def handCardValue(hand):
    strength = 0
    if len(hand) != 5:
        return 0
    strength = cardValue(hand[0]) * 10**8 + cardValue(hand[1]) * 10**6 + cardValue(hand[2]) * 10**4 + cardValue(hand[3]) * 10**2 + cardValue(hand[4])
    return strength

# base strength is most important and has value x*10^9
# then the value of the first card hand[0] multiplied by 10^8
# then the next card * 10^6 etc...

games = read_input_file()

for game in games:
    game.calculate_value()

#for game in games:
#    print(f"Hand: {game.hand}, Bid: {game.bid}, Value: {game.value}")

sorted_games = sorted(games, key=lambda x: x.value)

#print("sorted:\n")
#for game in sorted_games:
#    print(f"Hand: {game.hand}, Bid: {game.bid}, Value: {game.value}")

sum = 0
for i, game in enumerate(sorted_games):
    sum = sum + ((i+1) * game.bid)

print(sum)