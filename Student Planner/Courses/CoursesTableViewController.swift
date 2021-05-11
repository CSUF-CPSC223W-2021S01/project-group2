import UIKit

class CoursesTableViewController: UITableViewController {
    // empty array of Courses objects
    var courses = [Courses]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load the previously saved Courses() objects into courses so they can be displayed in the table view
        if let savedCourses = Courses.decodeCourses() {
            courses = savedCourses
        }

        // an edit button that brings the view table into editing mode allowing the user to delete and rearrange cells
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // function allows the "Cancel" and "Save" buttons to unwind to CoursesTableViewController from CourseDetailTableViewController
    @IBAction func unwindToCourse(segue: UIStoryboardSegue) {
        // checks whether the "Cancel" or "Save" button has been pressed and returns if "Cancel" was pressed
        guard segue.identifier == "saveUnwind" else {
            return
        }
        // check if a model object exists in CourseDetailTableViewController
        let sourceViewController = segue.source as! CourseDetailTableViewController
        
        if let course = sourceViewController.course {
            // if an existing Courses() object from array courses has been edited, the old info should be updated and the corresponding cell should be reloaded
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                courses[selectedIndexPath.row] = course
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            // otherwise, append and new Courses() object to array courses
            else {
                let newIndexPath = IndexPath(row: courses.count, section: 0)
                courses.append(course)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        
        Courses.saveCourses(courses)
    }
    
    // function passes the info of the Courses() object the user wants to edit to CourseDetailTableViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditCourse", let navVonctroller = segue.destination as? UINavigationController, let courseDetailTableViewController = navVonctroller.topViewController as? CourseDetailTableViewController {
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedCourse = courses[indexPath.row]
            courseDetailTableViewController.course = selectedCourse
        }
    }
    
    // function returns the number of Courses() objects in the array courses
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    // function dequeus a cell for the given indexPath, obtains the corresponding Courses() object from array courses, and updates the cell title to the course name and the subtitle to the course semester
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesCellIdentifier", for: indexPath)
        
        let course = courses[indexPath.row]
        cell.textLabel?.text = course.name
        cell.detailTextLabel?.text = course.semester
        return cell
    }

    // allow all table view cells to be editable
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // functions checks if the delete operation was called and then deletes the Courses() object from the array
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            courses.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Courses.saveCourses(courses)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = courses[sourceIndexPath.row]
        courses.remove(at: sourceIndexPath.row)
        courses.insert(movedObject, at: destinationIndexPath.row)
        
        Courses.saveCourses(courses)
    }
}
