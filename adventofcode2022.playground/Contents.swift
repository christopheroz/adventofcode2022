import UIKit

var document: [[Int]]? {
    guard let url = URL(resource: .init(name: "input")) else {
        print("error url")
        return nil
    }
    
    var all = [[Int]]()
    do {
        let contents = try String(contentsOf: url, encoding: .utf8)
        let lines = contents.split(separator:"\n\n")
        
        all = lines.map { line in
            line.split(separator:"\n").map { Int($0) ?? 0 }
        }
        
        
    } catch {
        print("Error: \(error.localizedDescription)")
        return nil
    }
    return all
}

func getTotalCalories() -> [Int] {
    document?.compactMap { calorie in
        calorie.reduce(0, +)
    } ?? []
}

print("Max total calories \(getTotalCalories().max())")


