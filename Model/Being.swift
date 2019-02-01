import UIKit

class Being: NSObject {
	var thereIs: Bool = true
	var parents: [Being] = []
	internal var customDescription: String?
	
	init(parents: [Being] = [], customDescription: String? = nil) {
		super.init()
		self.parents = parents
		self.parents.append(self)
		self.customDescription = customDescription
	}
	
	func transition() -> Being {
		let condition = parents.filter { $0.isMember(of: Being.self) }.count > 1 && parents.filter { $0.isMember(of: Nothing.self) }.count > 0
		return condition ? Becoming(parents: parents) : Nothing(parents: parents)
	}
	
	func think() -> Being {
		return transition()
	}
	
	func negation() -> Being {
		return transition()
	}
	
	func description() -> String {
		return customDescription ?? "Simple buing"
	}
}
