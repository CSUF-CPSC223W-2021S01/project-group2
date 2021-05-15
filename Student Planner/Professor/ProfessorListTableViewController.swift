//
//  ProfessorListTableViewController.swift
//  Student Planner
//
//  Created by Aaliyah Divinagracia on 5/11/21.
//

import Foundation
import UIKit

class ProfessorListTableViewController: UITableViewController {
    var prof: [Professor] = ProfessorList().list
    
    @IBOutlet var ProfessorItem: UITableView! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(nextView))
    }
}

extension ProfessorListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prof.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProfessorItem.dequeueReusableCell(withIdentifier: "ProfCell", for: indexPath)
        cell.textLabel?.text = prof[indexPath.row].profName
        return cell
    }
    @objc func nextView(){
        //navigationController?.pushViewController(ProfessorAddTableViewController(), animated: true)
    }
    
}


