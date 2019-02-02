//
//  OccurrenceTests.swift
//  HegelSOLTests
//
//  Created by Andrey Torlopov on 2/2/19.
//  Copyright © 2019 Andrey Torlopov. All rights reserved.
//

import XCTest
@testable import HegelSOL

class OccurrenceTests: XCTestCase {
	
	var sut: Occurrence!
	
	override func setUp() {
		super.setUp()
		let being = Being()
		if let becoming = being.think().transition().transition() as? Becoming {
			sut = becoming.momentOfOccurrence()
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
		XCTAssertTrue(sut.transition().isMember(of: Becoming.self))
		XCTAssertTrue(sut.transition().transition().think().isMember(of: Becoming.self))
	}
	
	func testDescription() {
		XCTAssertEqual(sut.description(), "\(String(.occurrenceMoment)): [4]")
	}
	
	func testDescriptionAfterThinking() {
		let result = sut.think()
		XCTAssertEqual(result.description(), "\(String(.nothingDescription)): [5]")
	}
}
