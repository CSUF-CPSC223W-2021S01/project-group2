import XCTest
@ testable import Student_Planner

class StudentPlannerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNoDays() throws {
        let content = Courses(name: "Computer Science 223W", semester: "Spring 2021", professor: "Paul Inventado", weightType: "Weighted", days: nil, times: "9:00 am - 10:50 am")
        XCTAssertNotNil(content)
    }
    
    func testNoTimes() throws {
        let content = Courses(name: "Art 123", semester: "Fall 2020", professor: "Bob Ross", weightType: "Points", days: "Monday & Wednesday", times: nil)
        XCTAssertNotNil(content)
    }
    
    func testEncodingCourseData() throws {
        
    }
    
    func testDecodingCourseData() throws {
        
    }
}
