import UIKit

class CourseDetailTableViewController: UITableViewController {
    // outlets for the text fields
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var semesterTextField: UITextField!
    @IBOutlet var professorTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var daysTextField: UITextField!
    @IBOutlet var timesTextField: UITextField!
    
    // outlet for the save button
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
        
        // disable save button when first creating a new course
        updateSaveButtonState()
    }
    
    // function disables the save button if the text fields for the course name, semester, professor, or weight type are empty
    func updateSaveButtonState() {
        let nameText = nameTextField.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty
        
        let semesterText = semesterTextField.text ?? ""
        saveButton.isEnabled = !semesterText.isEmpty
        
        let professorText = professorTextField.text ?? ""
        saveButton.isEnabled = !professorText.isEmpty
        
        let weightText = weightTextField.text ?? ""
        saveButton.isEnabled = !weightText.isEmpty
    }

    // action that calls updateSaveButtonState() whenever the text fields for the course name, semester, professor, or weight are edited
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    // function passes the new Courses() object information to CoursesTableViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // checks whether the "Cancel" or "Save" button has been pressed and returns if "Cancel" was pressed
        guard segue.identifier == "saveUnwind" else {
            return
        }
        
        // read the values from the text fields into constants and pass them into the Courses() initializer
        let courseName = nameTextField.text!
        let courseSemester = semesterTextField.text!
        let courseProfessor = professorTextField.text!
        let courseWeight = weightTextField.text!
        let courseDays = daysTextField.text!
        let courseTimes = timesTextField.text!
        
        // sets the property to its corresponding value
        course = Courses(name: courseName, semester: courseSemester, professor: courseProfessor, weightType: courseWeight, days: courseDays, times: courseTimes)
    }
}
