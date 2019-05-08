//
//  ArrivalTests.swift
//  HegelSOLTests
//
//  Created by Andrey Torlopov on 2/2/19.
//  Copyright © 2019 Andrey Torlopov. All rights reserved.
//

import XCTest
@testable import HegelSOL

class ArrivalTests: XCTestCase {
	
	var sut: Arrival!
	
	override func setUp() {
		super.setUp()
		let being = Being()
		if let becoming = being.transition().transition().transition() as? Becoming {
			sut = becoming.momentOfArrival()
		}
		else {
			fatalError()
		}
	}
	
	override func tearDown() {
		sut = nil
		super.tearDown()
	}
	
	func testNothinsIsNotNil() {
		XCTAssertNotNil(sut)
	}
	
	func testParentsCount() {
		XCTAssertEqual(sut.parents.count, 5)
	}
	
	func testTransitionAndThink() {
		XCTAssertTrue(sut.transition().isMember(of: Being.self))
		XCTAssertTrue(sut.transition().transition().transition().isMember(of: Becoming.self))
	}
	
	func testDescription() {
		XCTAssertEqual(sut.description(), "\(String(.nothingDescription)): [\(4)]")
	}
}
