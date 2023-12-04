import Foundation

/////////////////////////////////
/// PART 1
/////////////////////////////////

    do {
        let data = try String(contentsOfFile: "input.txt", encoding: .utf8)
        let games = data.components(separatedBy: "\n") // each game is separated by a newline
        var sum: Int = 0
        for (index, game) in games.enumerated() {
            let lines = game.components(separatedBy: "\n")
            
            for line in lines {
                if line.count > 1 {
                let gameID = index+1
                let coloursOnly = line.components(separatedBy: ":")[1]
                let components = coloursOnly.components(separatedBy: ";")
                    var gameCounted = false
                for component in components {
                    let items = component.components(separatedBy: ",")
                    for item in items {
                        let trimmedItem = item.trimmingCharacters(in: .whitespacesAndNewlines)
                        let number = Int(trimmedItem.filter("0123456789.".contains))!
                        let color = trimmedItem.components(separatedBy: CharacterSet.decimalDigits).joined().trimmingCharacters(in: .whitespacesAndNewlines)

                        if (color == "blue" && number > 14 && !gameCounted) {
                            sum = sum + gameID
                            gameCounted = true
                            print("Game \(gameID), new sum: \(sum)")
                        } else if (color == "red" && number > 12 && !gameCounted) {
                            sum = sum + gameID
                            gameCounted = true
                            print("Game \(gameID), new sum: \(sum)")
                        } else if (color == "green" && number > 13 && !gameCounted) {
                            sum = sum + gameID
                            gameCounted = true
                            print("Game \(gameID), new sum: \(sum)")
                        }
                    }
                }
                }
            }
        }
        // print(sum)
    } catch {
        print("Error reading the file:", error)
    }

////////////////////////////////////
// PART 2
////////////////////////////////////

    do {
        let data = try String(contentsOfFile: "input.txt", encoding: .utf8)
        let games = data.components(separatedBy: "\n")
        var sum: Int = 0
        for (index, game) in games.enumerated() {
            let lines = game.components(separatedBy: "\n")
            // print("Game \(index + 1):")
            
            for line in lines {
                if line.count > 1 {
                let gameID = index+1
                let coloursOnly = line.components(separatedBy: ":")[1]
                let components = coloursOnly.components(separatedBy: ";")

                var redNumbers = [Int]()
                var blueNumbers = [Int]()
                var greenNumbers = [Int]()


                    for component in components {
                        let items = component.components(separatedBy: ",")
                        for item in items {
                            let trimmedItem = item.trimmingCharacters(in: .whitespacesAndNewlines)
                            let number = Int(trimmedItem.filter("0123456789.".contains))!
                            let color = trimmedItem.components(separatedBy: CharacterSet.decimalDigits).joined().trimmingCharacters(in: .whitespacesAndNewlines)


                        if (color == "blue") {
                            blueNumbers.append(number)
                        } else if (color == "red") {
                            redNumbers.append(number)
                        } else if (color == "green") {
                            greenNumbers.append(number)
                        }
                            
                        }
                    }
                    let power = redNumbers.max()! * blueNumbers.max()! * greenNumbers.max()!
                    print(redNumbers, greenNumbers, blueNumbers)
                    print(redNumbers.max()!, greenNumbers.max()!, blueNumbers.max()!)
                    print(power)
                    sum = sum + power
                }
            }
        }
        print("Part 2 sum: \(sum)")
    } catch {
        print("Error reading the file:", error)
    }
