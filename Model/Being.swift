import UIKit

class Being {
	var thereIs: Bool = true
	var parents: [Being] = []
	internal var customDescription: String?
	
	init(parents: [Being] = [], customDescription: String? = nil) {
		self.parents = parents
		self.parents.append(self)
		self.customDescription = customDescription
	}
	
	func transition() -> Being {
		//FIXME: точное сравнение типов
		let condition = parents.filter { $0 is Being }.count > 1 && parents.filter { $0 is Nothing }.count > 0
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