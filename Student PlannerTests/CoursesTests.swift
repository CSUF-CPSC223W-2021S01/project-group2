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
    func testNoDays() throws {
        let content = Courses(name: "Computer Science 223W", semester: "Spring 2021", courseProfessor: "Paul Inventado", weightType: "Weighted", days: nil, times: "9:00 am - 10:50 am")
        XCTAssertNotNil(content)
    }
    
    func testNoTimes() throws {
        let content = Courses(name: "Art 123", semester: "Fall 2020", courseProfessor: "Bob Ross", weightType: "Points", days: "Monday & Wednesday", times: nil)
        XCTAssertNotNil(content)
    }
    
    func testNoCourseProfessor() throws {
        let content = Courses(name: "Math 456", semester: "Spring 2021", courseProfessor: nil, weightType: "Weighted", days: "Saturday", times: "9:00 - 11:45 am")
        XCTAssertNotNil(content)
    }
    
    func testCoursesInitializer() {
        let myCourse = Courses()
        XCTAssertEqual(myCourse.semesterCourses.count, 0)
    }
    
    func testHistoryDefaultInit() {
        _ = History()
    }
    
    func addCourse1() {
        
    }
}
