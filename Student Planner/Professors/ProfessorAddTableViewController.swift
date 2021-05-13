//
//  ProfessorAddTableViewController.swift
//  Student Planner
//
//  Created by Aaliyah Divinagracia on 5/12/21.
//

import UIKit

class ProfessorAddTableViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet var nameText: UITextField!
    @IBOutlet var emailText: UITextField!
    @IBOutlet var courseText: UITextField!
    @IBOutlet var officeLocationText: UITextField!
    @IBOutlet var officeHoursText: UITextField!
    @IBOutlet var phoneNumText: UITextField!
    @IBOutlet var websiteText: UITextField!
    
    var prof: Professor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profName = nameText.text!
        let profEmail = emailText.text!
        let course = courseText.text!
        let officeLocation = officeLocationText.text!
        let officeHours = officeHoursText.text!
        let phoneNum = phoneNumText.text!
        let website = websiteText.text!
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
