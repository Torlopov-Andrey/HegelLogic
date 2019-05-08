import Foundation

class Being: NSObject {
	
	var thereIs: Bool = true
	var parents: [Being] = []
	var customDescription: String?

	init(parents: [Being] = [], customDescription: String? = nil) {
		super.init()
		self.parents = parents
		self.parents.append(self)
		self.customDescription = customDescription
	}
	
	func transition() -> Being {
		return parents.count == 1 ? Nothing(parents: parents) : Becoming(parents: parents)
	}
	
	func negation() -> Being {
		return transition()
	}
	
	func description() -> String {
		return customDescription ?? String(.simpleBeing)
	}
}
