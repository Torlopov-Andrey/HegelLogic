//
//  BecomingTests.swift
//  HegelSOLTests
//
//  Created by Andrey Torlopov on 2/1/19.
//  Copyright © 2019 Andrey Torlopov. All rights reserved.
//

import XCTest
@testable import HegelSOL

class BecomingTests: XCTestCase {

	var sut: Becoming!
	
    override func setUp() {
        super.setUp()
		let being = Being()
		if let becoming = being.think().transition().transition() as? Becoming {
			sut = becoming
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
		XCTAssertEqual(sut.parents.count, 4)
	}
	
	func testTransitionAndThink() {
		XCTAssertTrue(sut.transition().isMember(of: Becoming.self))
		XCTAssertTrue(sut.transition().transition().think().isMember(of: Becoming.self))
	}
	
	func testDescription() {
		XCTAssertEqual(sut.description(), "\(String(.becomingDescription)): [3]")
	}
	
	func testOccurrenceMoment() {
		XCTAssertTrue(sut.momentOfOccurrence().isMember(of: Nothing.self))
	}
	
	func testArrivalMoment() {
		XCTAssertTrue(sut.momentOfArrival().isMember(of: Being.self))
	}
	
	func testOccurrenceDescription() {
		let model = sut.momentOfOccurrence()
		XCTAssertEqual(model.description(), "\(String(.occurrenceMoment)): [4]")
	}
	
	func testArrivalDescription() {
		let model = sut.momentOfArrival()
		print(model.parents.count)
		XCTAssertEqual(model.description(), "\(String(.arrivalMoment)): [4]")
	}
}
