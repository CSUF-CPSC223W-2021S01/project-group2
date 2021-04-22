import Foundation

struct Courses {
    var name: String // Computer Science 223W
    var semester: String // Spring 2021
    var weightType: String // Weighted
    var days: String? // Tuesday & Thursday
    var times: String? // 9:00 pm - 10:50 pm
    var courseProfessor: String? // Paul Inventado
    var semesterCourses = [Courses]()

    mutating func addCourse(newCourse: Courses) -> Bool {
        // if the given Courses instance has a matching name and semester in the array return false, otherwise add the newCourse and return true
        for course in semesterCourses {
            if course.name == newCourse.name, course.semester == newCourse.semester {
                return false
            }
        }
        semesterCourses.append(newCourse)
        return true
    }
}

/*
 let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
 let archiveURL = documentsDirectory.appendingPathComponent("courses_array").appendingPathExtension("plist")

 func encodeCourseArray() {
     let propertyListEncoder = PropertyListEncoder()
     let encodedCourses = try? propertyListEncoder.encode(semesterCourses)
     try? encodedCourses?.write(to: archiveURL, options: .noFileProtection)
 }

 func decodeCourseData() {
     let propertyListDecoder = PropertyListDecoder()
     if let retrievedCoursesData = try? Data(contentsOf: archiveURL),
         let decodedCourses = try? propertyListDecoder.decode(Array<Courses>.self, from: retrievedCoursesData) {
         print(decodedCourses)
     }
 }
 */
