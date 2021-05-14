// Created by Wesley Chou
import Foundation
class Assignments: Codable {
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

    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("Courses").appendingPathExtension("plist")

    static func decodeAssignments() -> [Assignments]? {
        guard let codedAssignments = try? Data(contentsOf: archiveURL) else {
            return nil
        }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode([Assignments].self, from: codedAssignments)
    }

    static func saveAssignments(_ Assignments: [Assignments]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedCourses = try? propertyListEncoder.encode(Assignments)
        try? encodedCourses?.write(to: archiveURL, options: .noFileProtection)
    }
}
