//Wesley Chou
//Last Date of Update: 3/24/2021
import Foundation
enum AssignmentType{
    case homework
    case quiz
    case exam
    case extraCredit
    case project 
}
class Assignments {
    var assignment: [String: String]?
    var totalAssignments: Int?
    var printOut: String
    init?() {
        printOut = ""
        if assignment == nil, totalAssignments == nil {
            return nil
        }
        else {
            self.assignment = [:]
            self.totalAssignments = 0
        }
    }

    func add(_ name: String, due: Date) {
        totalAssignments = totalAssignments! + 1
        printOut = "Your total Assignments to do are: $\(totalAssignments)"
    }

    func completedAssignment() {
        totalAssignments = totalAssignments! - 1
    }
}
