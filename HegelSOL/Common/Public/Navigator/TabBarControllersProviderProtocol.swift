//
//  TabBarControllersProviderProtocol.swift
//  Ebs
//
//  Created by Ильнур Ягудин on 17.07.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import Foundation

protocol TabBarControllersProviderProtocol {
	func registeredControllers() -> [TabBarAddableController]
}
