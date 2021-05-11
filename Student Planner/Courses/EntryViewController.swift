import UIKit

class EntryViewController: UIViewController {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var semesterField: UITextField!
    @IBOutlet var weightTypeField: UITextField!
    @IBOutlet var daysField: UITextField!
    @IBOutlet var timesField: UITextField!
    @IBOutlet var professorField: UITextField!

    public var completion: ((String, String, String, String, String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
    }

    @objc func didTapSave() {
        if let name = nameField.text, !name.isEmpty, let semester = semesterField.text, !semester.isEmpty, let weightType = weightTypeField.text, !weightType.isEmpty, let professor = professorField.text, !professor.isEmpty, let days = daysField.text, !days.isEmpty, let times = timesField.text, !times.isEmpty {
            completion?(name, semester, professor, weightType, days, times)
        }
    }
}
