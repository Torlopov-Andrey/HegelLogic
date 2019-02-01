//
//  Strings.swift
//  HegelSOL
//
//  Created by Andrey Torlopov on 2/1/19.
//  Copyright © 2019 Andrey Torlopov. All rights reserved.
//

import Foundation

extension String {
	
	enum Strings: String {
		case simpleBeing
		case nothingDescription
	}
}

extension String {
	
	func localized() -> String {
		return NSLocalizedString(self, comment: self)
	}
	
	//MARK: - Inits
	
	init(_ localized: Strings) {
		self.init(localized.rawValue.localized())
	}
	
	init(_ localized: Strings, localized value: Int) {
		self = String.localizedStringWithFormat(NSLocalizedString(String(localized), comment: ""), value)
	}
	
	init(declensionOf number: Int, _ normative: Strings, _ singular: Strings, _ plural: Strings, appendNumber: Bool = true) {
		var result = appendNumber ? "\(number) " : ""
		
		if number > 10 && ((number % 100) / 10 == 1) {
			result += plural.rawValue.localized()
		}
		else {
			switch number % 10 {
			case 1:
				result += normative.rawValue.localized()
			case 2...4:
				result += singular.rawValue.localized()
			default:
				result += plural.rawValue.localized()
			}
		}
		
		self = result
	}
}

