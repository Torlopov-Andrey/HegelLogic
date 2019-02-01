//
//  Nothing.swift
//  HegelSOL
//
//  Created by Andrey Torlopov on 9/26/18.
//  Copyright © 2018 Andrey Torlopov. All rights reserved.
//

import Foundation

class Nothing: Being {
	
	override func transition() -> Being {
		let condition = parents.filter { $0 is Being }.count > 1 && parents.filter { $0 is Nothing }.count > 0
		return condition ? Becoming(parents: parents) : Being(parents: parents)
	}
	
	override func description() -> String {
		return customDescription ?? "Nothing with parents [\(parents.count - 1)]"
	}
}
