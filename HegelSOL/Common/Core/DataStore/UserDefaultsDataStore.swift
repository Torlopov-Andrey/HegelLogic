//
//  UserDefaultsDataStore.swift
//
//  Created by Torlopov Andrey on 09.08.2018.
//

import Foundation

protocol UserDefaultsDataStoreProtocol {
	func get<T>(key: String, type: T.Type) -> T?
	func set(key: String, value: Any?)
	func remove(key: String)
}

class UserDefaultsDataStore: UserDefaultsDataStoreProtocol {
	
	public func get<T>(key: String, type: T.Type) -> T? {
		var res: T?
		performInUserDefaults { (def) in
			res = def.value(forKey: key) as? T
		}
		return res
	}
	
	public func set(key: String, value: Any?) {
		performInUserDefaults { (def) in
			def.setValue(value, forKey: key)
		}
	}
	
	func remove(key: String) {
		performInUserDefaults { (def) in
			def.removeObject(forKey: key)
		}
	}
	
	private func performInUserDefaults(_ action: ((UserDefaults) -> Void) ) {
		let def = UserDefaults.standard
		action(def)
		def.synchronize()
	}
}
