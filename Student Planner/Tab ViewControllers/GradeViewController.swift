import UIKit

class GradeViewController: UIViewController {
    @IBOutlet weak var assignmentName: UITextField!
    @IBOutlet weak var pointsRec: UITextField!
    @IBOutlet weak var pointsPos: UITextField!
    @IBOutlet weak var grade: UITextField!
    var grades = Grades()
    

    override func viewDidLoad() {
        //super.viewDidLoad()
        if let savedGrades = Grades.decodeGrades() {
            grade.text = String(grades!.grade)
        }
    }
    


    @IBAction func addAssignGrade(_ sender: UIButton) {
        let assignName = String(assignmentName.text!)
        let recPoints = Double(pointsRec.text!)!
        let posPoints = Double(pointsPos.text!)!
        grades?.add(name: assignName, gradeRec: recPoints, gradePos: posPoints)
        grades?.calcGrade()
        assignmentName?.text = ""
        pointsRec?.text = ""
        pointsPos?.text = ""
        //print(grades!.printGrade)
        grade.text = String(grades!.grade)
        
    }

}
