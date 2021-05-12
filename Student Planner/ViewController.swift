//
//  ViewController.swift
//  Student Planner
//
//  Created by Kaylee Bliaya on 3/1/21.
//

import UIKit

class ViewController: UIViewController {

     // Assignment Section----------------
    @IBOutlet var assignName: UITextField!
    @IBOutlet var DueDate: UITextField!
    @IBOutlet var count: UITextField!
    @IBOutlet var list: UITextField!
    var assign = Assignments()
    // End Assigment Section ----------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addAssignment(_ sender: Any) {
    let assignmentName = String(assignName.text!)
        let dueDate = String(DueDate.text!)
        assign?.add(name: assignmentName, due: dueDate)
        DueDate?.text = ""
        assignName?.text = ""
        print(assign!.printCount)
        count.text = assign?.printCount
        list.text = assign?.printArray
    
    }
    // End Assigment Section ----------------
}

