import UIKit

class Being {
	var thereIs: Bool = true
	var parents: [Being] = []
	
	init(parents: [Being] = []) {
		self.parents = parents
		self.parents.append(self)
	}
	
	func transition() -> Being {
		return Nothing(parents: parents)
	}
	
	func think() -> Being {
		return transition()
	}
	
	func description() -> String {
		return "Buing with parents [\(self.parents.count)]"
	}
}

class Nothing: Being {
	
	override func transition() -> Being {
		return Being(parents: parents)
	}
	
	override func description() -> String {
		return "Nothing with parents [\(self.parents.count)]"
	}
}
