import Foundation
class Assignments{
    var assignment : [String: String]   // dictionary, key: name value: due date/ time
    var totalAssignments: Int           // computed Property
    init(){
        self.assignment = [:]
        self.totalAssignments = 0
    }
    func add(_ name: String, due: String){
        totalAssignments = totalAssignments + 1
        
    }
    func completedAssignment(){
        totalAssignments = totalAssignments - 1
    }
}
// Things to do:
    // Figure out how to get a time as a String, or do we need a different variable type
    // Refer to Courses to choose the class that we are adding an Assignment into
    // update completedAssignment when button actions are avaliable
