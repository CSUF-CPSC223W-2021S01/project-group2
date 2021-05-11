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
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else {
            return
        }
        
        vc.title = "New Course"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.semesterCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = courses.semesterCourses[indexPath.row].name
        cell.detailTextLabel?.text = courses.semesterCourses[indexPath.row].semester
        cell.detailTextLabel?.text = courses.semesterCourses[indexPath.row].courseProfessor
        cell.detailTextLabel?.text = courses.semesterCourses[indexPath.row].weightType
        cell.detailTextLabel?.text = courses.semesterCourses[indexPath.row].days
        cell.detailTextLabel?.text = courses.semesterCourses[indexPath.row].times
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = storyboard?.instantiateViewController(identifier: "courseDetails") as? DetailsViewController else {
            return
        }
        vc.title = "Courses"
        navigationController?.pushViewController(vc, animated: true)
    }
}
