import XCTest
@ testable import Student_Planner

class StudentPlannerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    /*
    var name: String? // Computer Science 223W
    var semesterName: String? // Spring 2021
    var days: String? // Tuesday & Thursday
    var times: String? // 9:00 am - 10:50 am
    var courseProfessor: String? // Paul Inventado
    var weightType: String? // Weighted
     
     init?(name: String?, semesterName: String?, days: String?, times: String?, courseProfessor: String?, weightType: String?) 
    */
    func testNoName() throws {
        let content = Courses(name: nil, semesterName: "Spring 2021", days: "Tuesday & Thursday", times: "9:00 am - 10:50 am", courseProfessor: "Paul Inventado", weightType: "Weighted")
        XCTAssertNil(content)
    }
    
    func testNoSemesterName() throws {
        let content = Courses(name: "CPSC 223W", semesterName: nil, days: "Tuesday & Thursday", times: "9:00 am - 10:50 am", courseProfessor: "Paul Inventado", weightType: "Weighted")
        XCTAssertNil(content)
    }
    
    func testNoWeightType() throws {
        let content = Courses(name: "CPSC 223W", semesterName: "Spring 2021", days: "Tuesday & Thursday", times: "9:00 am - 10:50 am", courseProfessor: "Paul Inventado", weightType: nil)
        XCTAssertNil(content)
    }
}
