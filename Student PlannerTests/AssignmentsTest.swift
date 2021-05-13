//
//  AssignmentsTest.swift
//  Student PlannerTests
//
//  Created by wesley chou on 5/5/21.
//

@testable import Student_Planner
import XCTest
class AssignmentsTest: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testDefaultInitilizer() {
        let assignments = Assignments()
        XCTAssertEqual(assignments?.assignment, [:])
    }

    func testDefaultInitilizertotalAssigments() {
        let assignments = Assignments()
        XCTAssertEqual(assignments?.totalAssignments, 0)
    }

    func testDefaultInitilizerPrintOut() {
        let assignments = Assignments()
        XCTAssertEqual(assignments?.printCount, "Your total Assignments to do are: 0")
    }

    func testDefaultInitilizerPrintList() {
        let assignments = Assignments()
        XCTAssertEqual(assignments?.printDictionary, "")
    }

    func addAssignment() {
        let assignments = Assignments()
        let result = assignments?.add(name: "Test 1", due: "Jan 1st")
        XCTAssertEqual(assignments?.totalAssignments, 1)
    }
}
