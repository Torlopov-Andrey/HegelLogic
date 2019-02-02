//
//  Become.swift
//  HegelSOL
//
//  Created by Andrey Torlopov on 9/26/18.
//  Copyright © 2018 Andrey Torlopov. All rights reserved.
//

import Foundation

class Becoming: Being {
	
	func momentOfOccurrence() -> Occurrence {
		return Occurrence(parents: parents, customDescription: "\(String(.occurrenceMoment)): [\(parents.count)]")
	}
	
	func momentOfArrival() -> Arrival {
		return Arrival(parents: parents, customDescription: "\(String(.arrivalMoment)): [\(parents.count)]")
	}
	
	override func description() -> String {
		return customDescription ?? "\(String(.becomingDescription)): [\(parents.count - 1)]"
	}
}
