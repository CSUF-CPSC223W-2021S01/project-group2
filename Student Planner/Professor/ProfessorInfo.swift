//
//  ProfessorInfo.swift
//  Student Planner
//
//  Created by Aaliyah Divinagracia on 3/11/21.
//

import Foundation

struct Professor: Codable { 
    var profName: String
    var profEmail: String?
    var course: String?
    var officeLocation: String?
    var officeHours: String?
    var phoneNum: String?
    var website: String?
}

struct ProfessorList {
    var list: [Professor] = []
    
    mutating func AddProf(prof: Professor) {
        list.append(prof)
    }
    
    mutating func DeleteProf(index: Int) {
        list.remove(at: index)
    }
    
    func EditProf(_pName: String, _email: String, _course: String, _location: String, _hours: String, _phone: String, _site: String) -> Professor {
        return Professor(profName: _pName, profEmail: _email, course: _course, officeLocation: _location, officeHours: _hours, phoneNum: _phone, website: _site)
    }

    func DisplayProf() -> [String?] {
        var profNameList: [String?] = []
        
        for prof in list {
            profNameList.append(prof.profName)
        }
        
        return profNameList
    }
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("Professors").appendingPathExtension("plist")

    static func decodeProfessor() -> [Professor]? {

        guard let codedProfessor = try? Data(contentsOf: archiveURL) else {
            return nil
        }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode([Professor].self, from: codedProfessor)
    }

    static func saveProfessor(_ Professor: [Professor]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedProfessor = try? propertyListEncoder.encode(Professor)
        try? encodedProfessor?.write(to: archiveURL, options: .noFileProtection)
    }
}
