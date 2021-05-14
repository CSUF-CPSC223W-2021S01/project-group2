import Foundation
class Grades: Codable{
    var gradeRecieved: [String: Double] // dictionary with assignment name and grade recieved
    var gradePossible: [String: Double] // dictionary with assignment name and grade possible
    var recievedPoints: Double
    var possiblePoints: Double
    var grade: Double
   
    init?() {
        gradeRecieved = [:]
        gradePossible = [:]
        recievedPoints = 0
        possiblePoints = 0
        grade = 0
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
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("Grade").appendingPathExtension("plist")


    static func decodeGrades() -> [Grades]? {
        guard let codedGrades = try? Data(contentsOf: archiveURL) else {
            return nil
        }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode([Grades].self, from: codedGrades)
    }


    static func saveGrades(_ grades: [Grades]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedCourses = try? propertyListEncoder.encode(grades)
        try? encodedCourses?.write(to: archiveURL, options: .noFileProtection)
    }
}


