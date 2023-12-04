import Foundation

    do {
        let data = try String(contentsOfFile: "input.txt", encoding: .utf8)
        let lines = data.components(separatedBy: "\n") 
        var sum: Int = 0

        // NO TIME

    } catch {
        print("Error reading the file:", error)
    }