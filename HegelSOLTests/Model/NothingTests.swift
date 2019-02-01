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
		sut = being.think()
		
		super.setUp()
    }

    override func tearDown() {
		sut = nil
     	super.tearDown()
    }
}
