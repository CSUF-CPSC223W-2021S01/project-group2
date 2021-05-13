import Foundation
class Grades {
    var gradeRecieved: [String: Double] // dictionary with assignment name and grade recieved
    var gradePossible: [String: Double] // dictionary with assignment name and grade possible
    var recievedPoints: Double
    var possiblePoints: Double
    var grade: Double
    var printGrade: String
   
    init?() {
        gradeRecieved = [:]
        gradePossible = [:]
        recievedPoints = 0
        possiblePoints = 0
        grade = 0
        printGrade = ""
    }

    func add(name: String, gradeRec: Double, gradePos: Double) {
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
        grade = round((recievedPoints/possiblePoints) * 100) * 100 / 100.0
        
        //printGrade = "\(grade)"
        
    }
}


