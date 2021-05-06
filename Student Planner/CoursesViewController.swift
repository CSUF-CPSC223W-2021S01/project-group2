import UIKit

class CoursesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var courses = Courses()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
        title = "Courses"
    }
    
    @IBAction func didTapNewCourse() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.semesterCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = courses.semesterCourses[indexPath.row].name
        cell.detailTextLabel?.text = courses.semesterCourses[indexPath.row].semester
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Show course controller
        guard let vc = storyboard?.instantiateViewController(identifier: "course") as? CoursesViewController else {
            return
        }
        vc.title = "Course"
        navigationController?.pushViewController(vc, animated: true)
    }
}
