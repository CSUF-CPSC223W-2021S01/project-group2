import Foundation

struct Courses {
    var courseName: String // Computer Science 223W
    var days: String // Tuesday & Thursday
    var times: String // 9:00 pm - 10:50 pm
    var courseProfessor: String // Paul Inventado
    var weightType: String // Weighted
}

struct Categories {
    var category: String
    var categWeight: Int?
    var categPoints: Int?
    
}

struct Assignment {
    var assiName: String
    var totalPoints: Int
    var actualPoints: Int
    var assiGrade: Int {
        var grade = 0
        grade = actualPoints/totalPoints
        return grade
    }
    var assignDict: [String:Int]
    
    func add(){
        assignDict[assiName] = [assiGrade]
    }
    
}

struct Grade {
    var category: String
    var weight: Int?
    var totalPoints: Int?
}



