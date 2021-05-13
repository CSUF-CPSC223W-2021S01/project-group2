@testable import Student_Planner
import XCTest

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
    
    func testCoursesDefaultInit() {
        _ = Courses()
    }
    
    func testSavingCourseData() throws {
        var testCourses = [Courses]()
        
        let course1 = Courses(name: "Art 123", semester: "Fall 2020", professor: "Bob Ross", weightType: "Points", days: "Monday & Wednesday", times: nil)
        let course2 = Courses(name: "Computer Science 223W", semester: "Spring 2021", professor: "Paul Inventado", weightType: "Weighted", days: nil, times: "9:00 am - 10:50 am")
        testCourses.append(course1)
        testCourses.append(course2)
        Courses.saveCourses(testCourses)
        
        let courseDecoder = PropertyListDecoder()
        guard let saveLocation = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            XCTFail()
            return
        }
        let fileURL = saveLocation.appendingPathComponent("Courses").appendingPathExtension("plist")
        guard let courseFile = try? Data(contentsOf: fileURL), let decodedCourses = try? courseDecoder.decode([Courses].self, from: courseFile) else {
            XCTFail()
            return
        }
        XCTAssertEqual(testCourses, decodedCourses)
    }
    
    func testReadingCourseData() throws {
        var courseArray = [Courses]()
        var testCourses = [Courses]()
        
        let course1 = Courses(name: "Art 123", semester: "Fall 2020", professor: "Bob Ross", weightType: "Points", days: "Monday & Wednesday", times: nil)
        let course2 = Courses(name: "Computer Science 223W", semester: "Spring 2021", professor: "Paul Inventado", weightType: "Weighted", days: nil, times: "9:00 am - 10:50 am")
        courseArray.append(course1)
        courseArray.append(course2)
        
        let courseEncoder = PropertyListEncoder()
        guard let saveLocation = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first, let encodedHistory = try? courseEncoder.encode(courseArray) else {
            return
        }
        let fileURL = saveLocation.appendingPathComponent("Courses").appendingPathExtension("plist")
        try? encodedHistory.write(to: fileURL)
        
        if let savedCourses = Courses.decodeCourses() {
            testCourses = savedCourses
        }
        XCTAssertEqual(testCourses, courseArray)
    }
}
