//
//  Become.swift
//  HegelSOL
//
//  Created by Andrey Torlopov on 9/26/18.
//  Copyright © 2018 Andrey Torlopov. All rights reserved.
//

import Foundation

class Becoming: Being {
	
	func momentOfOccurrence() -> Nothing {
		return Nothing(parents: parents, customDescription: "Moment of occurrence with parents: [\(self.parents.count - 1)]")
	}
	
	func momentOfArrival() -> Being {
		return Being(parents: parents, customDescription: "Moment of arrival with parents: [\(self.parents.count - 1)]")
	}
	
	override func description() -> String {
		return "Becoming with parents [\(parents.count - 1)]"
	}
}
