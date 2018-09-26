//
//  TabBarControllersProvider.swift
//  Ebs
//
//  Created by Ильнур Ягудин on 17.07.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import UIKit

class TabBarControllersProvider: TabBarControllersProviderProtocol {
	func registeredControllers() -> [TabBarAddableController] {
		return [] // [AuthViewController.controllerFromStoryboard(.main)]
		//[AuthViewController(tabBarItem: UITabBarItem(title: "Auth", image: UIImage(named: "close_button"), tag: 0))]
	}
}
