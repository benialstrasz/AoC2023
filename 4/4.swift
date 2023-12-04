import Foundation

// PART 1
    do {
        let data = try String(contentsOfFile: "input.txt", encoding: .utf8)
        let cards = data.components(separatedBy: "\n") // each card is on a new line
        var sum: Int = 0

        for card in cards {
            var cardScore: Int = 0

            let allNumbers = card.components(separatedBy: ":")[1] // remove "Card X: componenet"
            let winningNumbersStrings = allNumbers.components(separatedBy: "|")[0].components(separatedBy: " ") // only numbers before |
            let myNumbersStrings = allNumbers.components(separatedBy: "|")[1].components(separatedBy: " ") // only numbers after |

            let winningNumbers = winningNumbersStrings.compactMap{ Int($0) }
            let myNumbers = myNumbersStrings.compactMap{ Int($0) }

            for wN in winningNumbers {
                if myNumbers.contains(wN) {
                    if cardScore == 0 {
                        cardScore = 1
                    } else {
                        cardScore = cardScore*2
                    }
                }
            }
            sum = sum + cardScore
        }
    print("Part1; The sum of all card scores is: \(sum)")
    } catch {
        print("Part1; Error reading the file:", error)
    }

    ///////////////////////////////////////////////////////
    // PART 2
    ///////////////////////////////////////////////////////

    do {
        let data = try String(contentsOfFile: "input.txt", encoding: .utf8)
        let cards = data.components(separatedBy: "\n") 

        var cardAmount: [Int] = Array(repeating: 1, count: cards.count)

        for (i, card) in cards.enumerated() {
                let allNumbers = card.components(separatedBy: ":")[1]

                let winningNumbersStrings = allNumbers.components(separatedBy: "|")[0].components(separatedBy: " ")
                let myNumbersStrings = allNumbers.components(separatedBy: "|")[1].components(separatedBy: " ")

                let winningNumbers = winningNumbersStrings.compactMap{ Int($0) }
                let myNumbers = myNumbersStrings.compactMap{ Int($0) }

                // for n in 1...cardAmount[i] { // slow but it works :P 
                    var cardScore: Int = 0

                    for wN in winningNumbers {
                        if myNumbers.contains(wN) {
                            cardScore = cardScore+1
                        }
                    }

                    if cardScore > 0 {
                      for j in i+1...i+cardScore { // you win copies of the next (i+1) cards
                        // cardAmount[i] = cardAmount[i]+1 // slow solution
                        cardAmount[j] = cardAmount[j]+cardAmount[i]
                      }
                    }
            // }
            print(i, cardAmount[i])
        }
        let totalSum = cardAmount.reduce(0,+)
    print("Part2: The sum of all card scores is: \(totalSum)")
    } catch {
        print("Error reading the file:", error)
    }