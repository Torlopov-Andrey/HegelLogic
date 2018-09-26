//
//  NavigatorProtocol.swift
//  Ebs
//
//  Created by Vitalii Poponov on 11.04.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import Foundation

enum NavigatorPresentationMode {
	
	///Standard pushViewController presentation with default iOS animation.
	case push
	
	///Modal presentation with custom transition.
	case modal
	
	///Modal presentation with navigation controller.
	case modalWithNavigation
	
	///Replaces the view controllers currently managed by the navigation controller with your view controller.
	case replace
	
	///Replaces only current view controller currently managed by the navigation controller with your view controller.
	case replaceWithPush
}

protocol NavigatorProtocol {
	var currentController: BaseViewController? {get set}
	func go(controller: BaseViewController, mode: NavigatorPresentationMode)
	func create(_ app: AppDelegate)
	func goMain()
}
