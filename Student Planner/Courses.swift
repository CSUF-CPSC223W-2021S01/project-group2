import Foundation

struct Courses {
    var name: String? // Computer Science 223W
    var semesterName: String? // Spring 2021
    var days: String? // Tuesday & Thursday
    var times: String? // 9:00 pm - 10:50 pm
    var courseProfessor: String? // Paul Inventado
    var weightType: String? // Weighted

    init?(name: String?, semesterName: String?, days: String?, times: String?, courseProfessor: String?, weightType: String?) {
        // if the course name, semester name, or weight type are not given, then return nil
        if name == nil || semesterName == nil || weightType == nil {
            return nil
        }
        self.name = name
        self.semesterName = semesterName
        self.days = days
        self.times = times
        self.courseProfessor = courseProfessor
        self.weightType = weightType
    }
}

// arrays of Courses instances
var courseArray: [Courses] = []
// dictionary with key: semesterName & value: courseArray
var semesterCourses = [String: [Courses]]()

// function to add a new course to a semester or create a new semester
func addCourse(semesterName: String, course: [Courses]) {
    // if the semester given already exists then append a new Courses instance to courseArray and assign it to its key (semesterName); otherwise create a new key
    if semesterCourses[semesterName] != nil {
        courseArray.append(contentsOf: course)
        semesterCourses[semesterName] = courseArray
    } else {
        semesterCourses[semesterName] = course
    }
}
