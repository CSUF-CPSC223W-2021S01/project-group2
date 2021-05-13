@testable import Student_Planner
import XCTest
class GradeTest: XCTestCase {

    func testDefaultInitilizer() {
        let grades = Grades()
        XCTAssertEqual(grades?.gradeRecieved, [:])
    }
    
    func testDefaultInitilizer2() {
        let grades = Grades()
        XCTAssertEqual(grades?.gradePossible, [:])
    }

    func testDefaultInitilizerGrade() {
        let grades = Grades()
        XCTAssertEqual(grades?.grade, 0)
    }

    func add() {
        let grades = Grades()
        let result = grades?.add(name: "test", gradeRec: 10, gradePos: 20)
        XCTAssertEqual(grades?.grade, 50.0)
    }
}
