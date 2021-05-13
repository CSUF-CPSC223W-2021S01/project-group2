import Foundation

struct Courses: Codable, Equatable {
    var name: String = "" // Computer Science 223W
    var semester: String = "" // Spring 2021
    var professor: String = "" // Paul Inventado
    var weightType: String = "" // Weighted
    var days: String? // Tues & Thurs
    var times: String? // 9:00 - 10:50 am

    static func == (lhs: Courses, rhs: Courses) -> Bool {
        return lhs.name == rhs.name && lhs.semester == rhs.semester && lhs.professor == rhs.professor && lhs.weightType == rhs.weightType && lhs.days == rhs.days && lhs.times == rhs.times
    }

    // represents a file URL in the user's document directory
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("Courses").appendingPathExtension("plist")

    // function to read data from the file
    static func decodeCourses() -> [Courses]? {
        // if the data doesn't exist, return nil; otherwise assign the data to the variable codedCourses
        guard let codedCourses = try? Data(contentsOf: archiveURL) else {
            return nil
        }
        // decode codedCourses using PropertyListDecoder()
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode([Courses].self, from: codedCourses)
    }

    // function to write data to the file
    static func saveCourses(_ courses: [Courses]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedCourses = try? propertyListEncoder.encode(courses)
        try? encodedCourses?.write(to: archiveURL, options: .noFileProtection)
    }
}
