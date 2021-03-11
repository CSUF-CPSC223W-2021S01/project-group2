import Foundation

class Courses {
    var courseName: String          // Computer Science 223W
    var days: String                // Tuesday & Thursday
    var times: String               // 9:00 pm - 10:50 pm
    var courseProfessor: String     // Paul Inventado
    var weightType: String          // Weighted
    
    init(courseName: String, days: String, times: String, courseProfessor: String, weightType: String) {
        self.courseName = courseName
        self.days = days
        self.times = times
        self.courseProfessor = courseProfessor
        self.weightType = weightType
    }
    
}
