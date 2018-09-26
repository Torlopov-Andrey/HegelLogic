//
//  BaseTabBarController.swift
//  Ebs
//
//  Created by Ильнур Ягудин on 17.07.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import UIKit

extension BaseTabBarController { // Describe the apperance of BaseTabBarController
	
    /// Apperance of BaseTabBarController
	public struct Appearance {
		let isTranslucent = false
		let selectedImageColor = UIColor.white
		let selectedTextColor = UIColor.black
		let tabBarShadowOffset = CGSize(width: 0, height: 0)
		let tabBarShadowRadius: CGFloat = 3
		let tabBarShadowColor = UIColor.black.cgColor
		let tabBarShadowOpacity: Float = 0.2
	}
}

/// BaseTabBarController with defaults parameters
class BaseTabBarController: UITabBarController {
	
	public let appearance = Appearance()
	
	var controllers: [BaseViewController]? {
		get {
			return viewControllers?.compactMap({ (vc) -> BaseViewController? in
				return (vc as? BaseNavigationController)?.viewControllers.first as? BaseViewController
			})
		}
		set {
			viewControllers = newValue
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tabBar.isTranslucent = appearance.isTranslucent
		tabBar.tintColor = appearance.selectedImageColor
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: appearance.selectedTextColor], for: .selected)
		tabBar.layer.shadowOffset = appearance.tabBarShadowOffset
		tabBar.layer.shadowRadius = appearance.tabBarShadowRadius
		tabBar.layer.shadowColor = appearance.tabBarShadowColor
		tabBar.layer.shadowOpacity = appearance.tabBarShadowOpacity
	}
}
