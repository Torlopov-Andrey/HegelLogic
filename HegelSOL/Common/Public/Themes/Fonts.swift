//
//  Fonts.swift
//  EldritchHorrorCards
//
//  Created by Andrey Torlopov on 7/28/18.
//  Copyright © 2018 Andrey Torlopov. All rights reserved.
//

import UIKit

extension UIFont {
	
	private enum FontNames: String {
		case light = "AppleSDGothicNeo-Light"
		case regular = "AppleSDGothicNeo-Regular"
		case bold = "AppleSDGothicNeo-Bold"
	}
	
	//MARK: Bold
	
	static var bold32: UIFont { return UIFont.bold(of: 32) }
	static var bold28: UIFont { return UIFont.bold(of: 28) }
	static var bold24: UIFont { return UIFont.bold(of: 24) }
	static var bold16: UIFont { return UIFont.bold(of: 16) }
	
	//MARK: Regular
	
	static var regular24: UIFont { return UIFont.regular(of: 24) }
	static var regular14: UIFont { return UIFont.regular(of: 14) }
	static var regular12: UIFont { return UIFont.regular(of: 12) }

	//MARK: Light
	
	static var light15: UIFont { return UIFont.light(of: 15) }
	
	//MARK: - Private
	
	private class func bold(of size: CGFloat) -> UIFont {
		return UIFont(name: FontNames.bold.rawValue, size: size)!
	}
	
	private class func regular(of size: CGFloat) -> UIFont {
		return UIFont(name: FontNames.regular.rawValue, size: size)!
	}
	
	private class func light(of size: CGFloat) -> UIFont {
		return UIFont(name: FontNames.light.rawValue, size: size)!
	}
}
