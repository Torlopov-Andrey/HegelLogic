import Foundation

class DI {
	
	static fileprivate let _di = DI()
	
	fileprivate let container = DIContainer()
	
	public static var providers: DIContainer {
		return _di.container
	}
	
	public static func registerProviders() {
		_di.register()
	}
	
	fileprivate func register() {
		container.register(UserDefaultsDataStoreProtocol.self) { UserDefaultsDataStore() }
		container.register(NavigatorProtocol.self, asSingleTone: true) { AppNavigator()  }
		container.register(TabBarControllersProviderProtocol.self, asSingleTone: true) { TabBarControllersProvider() }
	}
}
