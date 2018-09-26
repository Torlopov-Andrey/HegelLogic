//
//  Colors.swift
//  EldritchHorrorCards
//
//  Created by Andrey Torlopov on 7/28/18.
//  Copyright © 2018 Andrey Torlopov. All rights reserved.
//

import UIKit

extension UIColor {
	
	static var darkGreenBlue: UIColor { return UIColor(components: 31, green: 116, blue: 110) }
	static var darkGreenBlueLight: UIColor { return UIColor(components: 35, green: 128, blue: 100) }
	
	//MARK: - Inits
	
	convenience init(components red: CGFloat, green: CGFloat, blue: CGFloat) {
		let const: CGFloat = 255.0
		self.init(red: red/const, green: green/const, blue: blue/const, alpha: 1)
	}
	
	convenience init(components red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
		let const: CGFloat = 255.0
		self.init(red: red/const, green: green/const, blue: blue/const, alpha: alpha/const)
	}
}
