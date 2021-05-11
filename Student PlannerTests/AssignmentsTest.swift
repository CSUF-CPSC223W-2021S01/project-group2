//
//  AssignmentsTest.swift
//  Student PlannerTests
//
//  Created by wesley chou on 5/5/21.
//

import XCTest
@testable import Student_Planner
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
    func testDefaultInitilizer(){
        let assignments = Assignments()
        XCTAssertEqual(assignments?.assignment,"")
    }
    func testDefaultInitilizertotalAssigments(){
        let assignments = Assignments()
        XCTAssertEqual(assignments?.totalAssignments,0)
    }
    func testDefaultInitilizerPrintOut(){
        let assignments = Assignments()
        XCTAssertEqual(assignments?.printOut,"")
    }
    func addAssignment() {
        let assignments = Assignments()
        let result = assignments?.add("Test 1", due: "06102021" )
        XCTAssertEqual(assignments?.totalAssignments, 1)
    }
}