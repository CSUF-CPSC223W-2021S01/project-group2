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
    var assignment: [String: String]
    var totalAssignments: Int
    var printCount: String
    var printArray: String
    init?() {
        printCount = "Your total Assignments to do are: 0"
        self.assignment = [:]
        self.totalAssignments = 0
        printArray = ""
    }

    func add(name: String, due: String) {
        totalAssignments = totalAssignments + 1
        printCount = "Your total Assignments to do are: \(totalAssignments)"
        assignment[name] = due
        printArray = "\(assignment.forEach { print("\($0) is due on \($1)") })"
        //printArray = "\(assignment as AnyObject)"
        //assignment.forEach { print("\($0): \($1)") }

    }

    func completedAssignment() {
        totalAssignments = totalAssignments - 1
    }
}
