//
//  Navigator.swift
//  Ebs
//
//  Created by Vitalii Poponov on 11.04.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import UIKit

import UIKit

class AppNavigator: NSObject, NavigatorProtocol {
	
	var currentController: BaseViewController?
	var tabBarControllersProvider: TabBarControllersProviderProtocol
	let tabBarController: BaseTabBarController
	var app: AppDelegate?
	
	init(tabBarControllersProvider: TabBarControllersProviderProtocol = DI.providers.resolve(TabBarControllersProviderProtocol.self)!) {
		self.tabBarControllersProvider = tabBarControllersProvider
		tabBarController = BaseTabBarController()
	}
	
	func go(controller: BaseViewController, mode: NavigatorPresentationMode) {
		display(controller: controller, mode: mode)
	}
	
	func create(_ app: AppDelegate) {
		self.app = app
		makeWindowVisible(app)
		goMain()
	}
	
	func goMain() {
		let controller = MainViewController()
		self.app?.window?.rootViewController = controller
		currentController = controller
	}
	
	private var safetyCurrentController: BaseViewController {
		guard let current = self.currentController else {
			fatalError("Call create method before use navigation.")
		}
		return current
	}
	
	private func display(controller: UIViewController, mode: NavigatorPresentationMode) {
		if let current = currentController, current.isExclusiveController, current.isKind(of: type(of: controller)) {
			return
		}
		
		switch mode {
		case .push:
			
			guard let navController = safetyCurrentController.navigationController else {
				present(controller: controller)
				return
			}
			navController.pushViewController(controller, animated: true)
			
		case .modalWithNavigation:
			
			let navController = BaseNavigationController(rootViewController: controller)
			present(controller: navController)
			
		case .replace:
			
			guard let navController = safetyCurrentController.navigationController else {
				present(controller: controller)
				return
			}
			navController.setViewControllers([controller], animated: false)
			
		case .replaceWithPush:
			
			guard let navController = safetyCurrentController.navigationController else {
				present(controller: controller)
				return
			}
			navController.pushViewController(controller, animated: true)
			let controllers = navController.viewControllers.filter { $0 != currentController }
			navController.setViewControllers(controllers, animated: false)
		case .modal:
			present(controller: controller)
		}
	}
	
	private func present(controller: UIViewController) {
		safetyCurrentController.present(controller, animated: true, completion: nil)
	}
	
	private func makeWindowVisible(_ app: AppDelegate) {
		app.window = UIWindow(frame: UIScreen.main.bounds)
		app.window?.backgroundColor = UIColor.white
		app.window?.makeKeyAndVisible()
	}
}

extension AppNavigator: UITabBarControllerDelegate {
	func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
		currentController = (viewController as? UINavigationController)?.topViewController as? BaseViewController
	}
}

