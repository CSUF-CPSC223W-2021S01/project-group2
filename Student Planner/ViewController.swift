//
//  ViewController.swift
//  Student Planner
//
//  Created by Kaylee Bliaya on 3/1/21.
//
import UIKit

class ViewController: UIViewController {

     // Assignment Section----------------
    @IBOutlet var DueDate: UIDatePicker!
    @IBOutlet var AssignmentName: UITextField!
    @IBOutlet var assignCount: UITextField!
    var assign = Assignments()
    // End Assigment Section ----------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Assignment Section----------------
    @IBAction func addAssignment(_ sender: Any) {
        let assignmentName = String(AssignmentName.text!)
        assign?.add(assignmentName, due: DueDate.date)
        
        print(assign!.printOut)
        assignCount.text = assign?.printOut
    }
    // End Assigment Section ----------------
}
