// Created by Wesley Chou
import Foundation
class Assignments {
    var assignment: [String: String] // uses a dictionary to store a value of name and key of due date
    var totalAssignments: Int
    var printCount: String
    var printDictionary: String
    init?() {
        printCount = "Your total Assignments to do are: 0"
        assignment = [:]
        totalAssignments = 0
        printDictionary = ""
    }

    func add(name: String, due: String) {
        totalAssignments = totalAssignments + 1
        printCount = "Your total Assignments to do are: \(totalAssignments)"
        assignment[name] = due
        printDictionary = "Your assignments are : \(dump(assignment))"
    }
}
