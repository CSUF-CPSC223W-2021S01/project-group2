import UIKit

class CourseDetailTableViewController: UITableViewController {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var semesterTextField: UITextField!
    @IBOutlet var professorTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var daysTextField: UITextField!
    @IBOutlet var timesTextField: UITextField!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    var course: Courses?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let course = course {
            navigationItem.title = "Course"
            nameTextField.text = course.name
            semesterTextField.text = course.semester
            professorTextField.text = course.professor
            weightTextField.text = course.weightType
            daysTextField.text = course.days
            timesTextField.text = course.times
        }
        
        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        let nameText = nameTextField.text ?? ""
        let semesterText = nameTextField.text ?? ""
        let professorText = nameTextField.text ?? ""
        let weightText = nameTextField.text ?? ""
        if nameText.isEmpty || semesterText.isEmpty || professorText.isEmpty || weightText.isEmpty {
            saveButton.isEnabled = false
        }
        else {
            saveButton.isEnabled = true
        }
    }
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        nameTextField.resignFirstResponder()
        semesterTextField.resignFirstResponder()
        professorTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
        daysTextField.resignFirstResponder()
        timesTextField.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else {
            return
        }
        
        let courseName = nameTextField.text!
        let courseSemester = semesterTextField.text!
        let courseProfessor = professorTextField.text!
        let courseWeight = weightTextField.text!
        let courseDays = daysTextField.text!
        let courseTimes = timesTextField.text!
        
        course = Courses(name: courseName, semester: courseSemester, professor: courseProfessor, weightType: courseWeight, days: courseDays, times: courseTimes)
    }
    
    
}

