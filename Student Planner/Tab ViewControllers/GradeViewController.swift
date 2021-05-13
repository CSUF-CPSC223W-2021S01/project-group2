import UIKit

class GradeViewController: UIViewController {
    @IBOutlet weak var assignmentName: UITextField!
    @IBOutlet weak var pointsRec: UITextField!
    @IBOutlet weak var pointsPos: UITextField!
    @IBOutlet weak var grade: UITextField!
    var grades = Grades()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


    @IBAction func addAssignGrade(_ sender: UIButton) {
        let assignName = String(assignmentName.text!)
        let recPoints = Int(pointsRec.text!)
        let posPoints = Int(pointsPos.text!)
        grades?.add(name: assignName, gradeRec: recPoints!, gradePos: posPoints!)
        assignmentName?.text = ""
        pointsRec?.text = ""
        pointsPos?.text = ""
        grade?.text = String(grades!.grade)
        
    }

}
