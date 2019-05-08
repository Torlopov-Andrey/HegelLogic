//
//  Nothing.swift
//  HegelSOL
//
//  Created by Andrey Torlopov on 9/26/18.
//  Copyright © 2018 Andrey Torlopov. All rights reserved.
//

import Foundation

class Nothing: Being {
	
	override func description() -> String {
		return customDescription ?? "\(String(.nothingDescription)): [\(parents.count - 1)]"
	}
}
