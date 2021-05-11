import UIKit

class CoursesTableViewController: UITableViewController {
    var courses = [Courses]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedCourses = Courses.decodeCourses() {
            courses = savedCourses
        }

        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func unwindToCourse(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else {
            return
        }
        let sourceViewController = segue.source as! CourseDetailTableViewController
        
        if let course = sourceViewController.course {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                courses[selectedIndexPath.row] = course
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                let newIndexPath = IndexPath(row: courses.count, section: 0)
                courses.append(course)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        
        Courses.saveCourses(courses)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditCourse", let navVonctroller = segue.destination as? UINavigationController, let courseDetailTableViewController = navVonctroller.topViewController as? CourseDetailTableViewController {
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedCourse = courses[indexPath.row]
            courseDetailTableViewController.course = selectedCourse
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesCellIdentifier", for: indexPath)
        
        let course = courses[indexPath.row]
        cell.textLabel?.text = course.name
        cell.detailTextLabel?.text = course.semester
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            courses.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Courses.saveCourses(courses)
        }
    }
}
