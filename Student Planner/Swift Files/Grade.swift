import Foundation
class Grades {
    var gradeRecieved: [String: Int] // dictionary with assignment name and grade recieved
    var gradePossible: [String: Int] // dictionary with assignment name and grade possible
    var recievedPoints: Int
    var possiblePoints: Int
    var grade: Int
   
    init?() {
        gradeRecieved = [:]
        gradePossible = [:]
        recievedPoints = 0
        possiblePoints = 0
        grade = 0
    }

    func add(name: String, gradeRec: Int, gradePos: Int ) {
        gradeRecieved[name] = gradeRec
        gradePossible[name] = gradePos
    
    }
    
    func calcGrade() {
        for recValue in gradeRecieved.values {
            recievedPoints += recValue
        }
        for posValue in gradePossible.values {
            possiblePoints += posValue
        }
        grade = (recievedPoints/possiblePoints) * 100
    }
}


