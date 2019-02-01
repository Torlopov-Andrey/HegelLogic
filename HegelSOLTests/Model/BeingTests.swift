//
//  BeingTests.swift
//  HegelSOLTests
//
//  Created by Andrey Torlopov on 2/1/19.
//  Copyright © 2019 Andrey Torlopov. All rights reserved.
//

import XCTest
@testable import HegelSOL

class BeingTests: XCTestCase {

	var sut: Being!
	
    override func setUp() {
        super.setUp()
		sut = Being(parents: [], customDescription: nil)
    }

    override func tearDown() {
		sut = nil
        super.tearDown()
    }

    func testBeingIsNotNil() {
		XCTAssertNotNil(sut)
    }
	
	func testBeingParentIsEmpty() {
		XCTAssertEqual(sut.parents.count, 1)
	}
	
	func testTransitionAndThink() {
		let result = sut.transition()
		XCTAssertTrue(result.isMember(of: Nothing.self))
	}
	
	func testNotSimpleBeingTransitionAndThink() {
		let result = sut.transition().transition()
		XCTAssertTrue(result.isMember(of: Being.self))
	}
	
	func testBecomingTransitionAndThink() {
		let result = sut.transition().transition().transition()
		XCTAssertTrue(result.isMember(of: Becoming.self))
	}
	
	func testDescription() {
		XCTAssertEqual(sut.description(), String(.simpleBeing))
	}
}
