//
//  BaseNavigationController.swift
//  Ebs
//
//  Created by Ильнур Ягудин on 18.07.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import UIKit

extension BaseNavigationController {
	struct Appearance {
		let isTranslucent = false
	}
}

class BaseNavigationController: UINavigationController {
	var appearance = Appearance()
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationBar.isTranslucent = appearance.isTranslucent
	}
}
