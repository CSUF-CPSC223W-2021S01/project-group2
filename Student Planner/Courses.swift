import Foundation

struct Courses: Codable, Equatable {
    var name: String // Computer Science 223W
    var semester: String // Spring 2021
    var weightType: String // Weighted
    var days: String? // Tuesday & Thursday
    var times: String? // 9:00 pm - 10:50 pm
    var courseProfessor: String? // Paul Inventado
    var semesterCourses = [Courses]()

    // protocol to check if two Courses objects are equal
    static func == (lhs: Courses, rhs: Courses) -> Bool {
        return lhs.name == rhs.name && lhs.semester == rhs.semester && lhs.weightType == rhs.weightType && lhs.days == rhs.days && lhs.times == rhs.times && lhs.courseProfessor == rhs.courseProfessor
    }

    mutating func addCourse(newCourse: Courses) -> Bool {
        // if the given Courses object newCourse and a Courses object in the array match return false, otherwise append newCourse to the array and return true
        for course in semesterCourses {
            if course == newCourse {
                return false
            }
        }
        semesterCourses.append(newCourse)
        return true
    }

    mutating func removeCourse(courseToBeRemoved: Courses) -> Bool {
        // if the given Courses object newCourse and a Courses object in the array match remove it from the array and return true, otherwise return false
        var arrayIndex = 0
        for course in semesterCourses {
            if course == courseToBeRemoved {
                semesterCourses.remove(at: arrayIndex)
                return true
            }
            arrayIndex += 1
        }
        return false
    }
}

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("Courses").appendingPathExtension("plist")

func encodeCourseArray(course: Courses) {
    let propertyListEncoder = PropertyListEncoder()
    let encodedCourses = try? propertyListEncoder.encode(course.semesterCourses)
    try? encodedCourses?.write(to: archiveURL, options: .noFileProtection)
}

func decodeCourseData() {
    let propertyListDecoder = PropertyListDecoder()
    if let retrievedCoursesData = try? Data(contentsOf: archiveURL),
       let decodedCourses = try? propertyListDecoder.decode([Courses].self, from: retrievedCoursesData)
    {
        print(decodedCourses)
    }
}
