import UIKit

print("W.F.Gegel - Logic.")

class Being {
	var thereIs: Bool = true
	var parents: [Being] = []
	
	private var customDescription: String?
	
	init(parents: [Being] = [], customDescription: String? = nil) {
		self.parents = parents
		self.parents.append(self)
	}
	
	func transition() -> Being {
		//FIXME: точное сравнение типов
		let condition = parents.filter { $0 is Being }.count > 0 && parents.filter { $0 is Nothing }.count > 0
		return condition ? Becoming(parents: parents) : Nothing(parents: parents)
	}
	
	func think() -> Being {
		return transition()
	}
	
	func negation() -> Being {
		return transition()
	}
	
	func description() -> String {
		return customDescription == nil ? "Buing with parents [\(self.parents.count)]" : customDescription!
	}
}

class Nothing: Being {

	override func transition() -> Being {
		let condition = parents.filter { $0 is Being }.count > 0 && parents.filter { $0 is Nothing }.count > 0
		return condition ? Becoming(parents: parents) : Being(parents: parents)
	}
	
	override func description() -> String {
		return customDescription == nil ? "Nothing with parents [\(self.parents.count)]" : customDescription!
	}
}

class Becoming: Being {
	
	func momentOfOccurrence() -> Nothing {
		return Nothing(parents: parents, customDescription: "Moment of occurrence with parents: [\(self.parents.count)]")
	}
	
	func momentOfArrival() -> Being {
		return Being(parents: parents, customDescription: "Moment of arrival with parents: [\(self.parents.count)]")
	}
		
	override func description() -> String {
		return "Becoming with parents [\(self.parents.count)]"
	}
}

let buing = Being()
let nothing = buing.think().think().think().think()

print(buing.description())
print(nothing.description())

if let nothing = nothing as? Becoming {
	nothing.momentOfArrival()
}
