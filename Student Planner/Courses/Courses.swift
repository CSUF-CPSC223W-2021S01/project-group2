import Foundation

struct Courses: Codable {
    var name: String = "" // Computer Science 223W
    var semester: String = "" // Spring 2021
    var professor: String = "" // Paul Inventado
    var weightType: String = "" // Weighted
    var days: String? // Tuesday & Thursday
    var times: String? // 9:00 pm - 10:50 pm
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("Courses").appendingPathExtension("plist")
    
    static func decodeCourses() -> [Courses]? {
        guard let codedCourses = try? Data(contentsOf: archiveURL) else {
            return nil
        }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<Courses>.self, from: codedCourses)
    }
    
    static func saveCourses(_ courses: [Courses]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedCourses = try? propertyListEncoder.encode(courses)
        try? encodedCourses?.write(to: archiveURL, options: .noFileProtection)
    }
}
