import Foundation 

/////////////////////////////////
/// PART 1
/////////////////////////////////

// read file, return String
func readFromFile() -> [String]? {
    let filePath = "input.txt"
    do {
        let contents = try String(contentsOfFile: filePath, encoding: .utf8)
        return contents.components(separatedBy:"\n")
    } catch {
        print("Error reading file: \(error.localizedDescription)")
        return nil
    }
}

func stringToTwoDigitNumber(string: String) -> Int {
    var number = string.filter("0123456789.".contains)
    if number.count == 1 {
        number = number + number
    } else if number.count > 2 {
        number = "\(number.prefix(1))" + "\(number.suffix(1))"
    }
    return Int(number) ?? 0
}

if let input = readFromFile() {
    // var array = [Int]()
    // for i in 0 ..< input.count {
    //     array.append(stringToTwoDigitNumber(string: input[i]))
    //     // print(stringToTwoDigitNumber(string: input[i]))
    //     // print(array)
    // }
    let array = input.map { stringToTwoDigitNumber(string: $0) }
    let totalSum = array.reduce(0, +)
    print("The sum is: \(totalSum)")
}

///////////////////////////////////
/// MARK: PART 2
///////////////////////////////////


func stringToTwoDigitNumberUpdated(string: String) -> Int {
    let converted: String =  string // hacky workaround needed for cases like twone where two isnt recognised anymore because "one" is replaced first.
    .replacingOccurrences(of: "one", with: "one1one")
    .replacingOccurrences(of: "two", with: "two2two")
    .replacingOccurrences(of: "three", with: "three3three")
    .replacingOccurrences(of: "four", with: "four4four")
    .replacingOccurrences(of: "five", with: "five5five")
    .replacingOccurrences(of: "six", with: "six6six")
    .replacingOccurrences(of: "seven", with: "seven7seven")
    .replacingOccurrences(of: "eight", with: "eight8eight")
    .replacingOccurrences(of: "nine", with: "nine9nine")

    var number: String = converted.filter("0123456789.".contains)
    if number.count == 1 {
        number = number + number
    } else if number.count > 2 {
        number = "\(number.prefix(1))" + "\(number.suffix(1))"
    }
    return Int(number) ?? 0
}

if let newInput = readFromFile() {
    let array = newInput.map { stringToTwoDigitNumberUpdated(string: $0) }
    let totalSum = array.reduce(0, +)
    // print(array)
    print("The sum is: \(totalSum)")
}