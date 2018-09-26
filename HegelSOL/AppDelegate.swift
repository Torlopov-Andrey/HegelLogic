//
//  AppDelegate.swift
//  HegelSOL
//
//  Created by Andrey Torlopov on 9/26/18.
//  Copyright © 2018 Andrey Torlopov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
		print("\n\(documentsPath)\n")
		
		DI.registerProviders()
		DI.providers.resolve(NavigatorProtocol.self)?.create(self)
		
		return true
	}
}

