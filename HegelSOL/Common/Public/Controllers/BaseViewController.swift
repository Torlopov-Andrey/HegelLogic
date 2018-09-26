import UIKit

class BaseViewController: UIViewController {
	
	var isHiddenNavigationBar = false
	
	/// navigation won't not open controller twice if controller exclusive and opened
	var isExclusiveController = false
	var isSetAsCurrentController = true
	
	var appNavigator = DI.providers.resolve(NavigatorProtocol.self)
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(isHiddenNavigationBar, animated: true)
		if isSetAsCurrentController { appNavigator?.currentController = self }
	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle { return .default }
	
	private var isLightStatusFont: Bool {
		guard let identifier = self.restorationIdentifier else { return true }
		return identifier == "AuthViewController"
	}
}

class TabBarAddableController: BaseViewController {
	
	required init(tabBarItem: UITabBarItem) {
		super.init(nibName: nil, bundle: nil)
		self.tabBarItem = tabBarItem
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
}
