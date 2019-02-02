//
//  NothingTests.swift
//  HegelSOLTests
//
//  Created by Andrey Torlopov on 2/1/19.
//  Copyright © 2019 Andrey Torlopov. All rights reserved.
//

import XCTest
@testable import HegelSOL

class NothingTests: XCTestCase {
	
	var sut: Nothing!
	
	override func setUp() {
		let being = Being()
		if let nothing = being.think() as? Nothing {
			sut = nothing
		}
		else {
			fatalError()
		}
		
		super.setUp()
	}
	
	override func tearDown() {
		sut = nil
		super.tearDown()
	}
	
	func testNothinsIsNotNil() {
		XCTAssertNotNil(sut)
	}
	
	func testParentsCount() {
		XCTAssertEqual(sut.parents.count, 2)
	}
	
	func testNotSimpleBeingTransitionAndThink() {
		let result = sut.transition()
		XCTAssertTrue(result.isMember(of: Being.self))
	}
	
	func testBecomingTransitionAndThink() {
		let result = sut.transition().transition()
		XCTAssertTrue(result.isMember(of: Becoming.self))
	}
	
	func testDescription() {
		XCTAssertEqual(sut.description(), "\(String(.nothingDescription)): [\(1)]")
	}
}
