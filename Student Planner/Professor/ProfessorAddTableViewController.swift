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
    var update: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.text = prof?.profName
        emailText.text = prof?.profEmail
        courseText.text = prof?.profEmail
        officeLocationText.text = prof?.officeLocation
        officeHoursText.text = prof?.officeHours
        phoneNumText.text = prof?.phoneNum
        websiteText.text = prof?.website
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveInfo))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveInfo()
        return true
    }

    @objc func saveInfo() {
        //save the user info to prof
        prof = Professor(profName: nameText.text!, profEmail: emailText.text!, course: courseText.text!, officeLocation: officeLocationText.text!, officeHours: officeHoursText.text!, phoneNum: courseText.text!, website: websiteText.text!)
        print(prof)
        ProfArray.append(prof!)
        //return to previous view - none of these work because this class was not pushed onto the stack.
        //self.navigationController?.popToViewController(ProfessorListTableViewController(), animated: true)
        //navigationController?.pushViewController(ProfessorListTableViewController(), animated: true)
        //self.present(ProfessorListTableViewController(), animated: true, completion: update )
        //self.navigationController?.popViewController(animated: true)
    }
}
