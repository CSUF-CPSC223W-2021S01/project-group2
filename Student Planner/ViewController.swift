//
//  ViewController.swift
//  Student Planner
//
//  Created by Kaylee Bliaya on 3/1/21.
//

import UIKit

class ViewController: UIViewController {
    // Assignment Section----------------
    // By Wesley Chou
    @IBOutlet var assignName: UITextField!
    @IBOutlet var DueDate: UITextField!
    @IBOutlet var count: UITextField!
    @IBOutlet var list: UITextView!
    var assign = Assignments()
    // End Assigment Section ----------------
    override func viewDidLoad() {
        if let savedAssignments = Assignments.decodeAssignments() {
            list.text = assign?.printDictionary
            count.text = assign?.printCount
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Assignment Section --------
    @IBAction func addAssignment(_ sender: UIButton) {
        let assignmentName = String(assignName.text!)
        let dueDate = String(DueDate.text!)
        assign?.add(name: assignmentName, due: dueDate)
        DueDate?.text = ""
        assignName?.text = ""
        print(assign!.printCount)
        count.text = assign?.printCount
        list.text = assign?.printDictionary
    }

    // End Assigment Section ----------------
}
