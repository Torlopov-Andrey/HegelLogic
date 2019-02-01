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
}
