import UIKit

print("W.F.Gegel - Logic.")
//
//class Being {
//	var thereIs: Bool = true
//	var parents: [Being] = []
//
//	internal var customDescription: String?
//
//	init(parents: [Being] = [], customDescription: String? = nil) {
//		self.parents = parents
//		self.parents.append(self)
//		self.customDescription = customDescription
//	}
//
//	func transition() -> Being {
//		//FIXME: точное сравнение типов
//		let condition = parents.filter { $0 is Being }.count > 1 && parents.filter { $0 is Nothing }.count > 0
//		return condition ? Becoming(parents: parents) : Nothing(parents: parents)
//	}
//
//	func think() -> Being {
//		return transition()
//	}
//
//	func negation() -> Being {
//		return transition()
//	}
//
//	func description() -> String {
//		return customDescription ?? "Simple being"
//	}
//}
//
//class Nothing: Being {
//
//	override func transition() -> Being {
//		let condition = parents.filter { $0 is Being }.count > 0 && parents.filter { $0 is Nothing }.count > 1
//		return condition ? Becoming(parents: parents) : Being(parents: parents)
//	}
//
//	override func description() -> String {
//		return customDescription ?? "Nothing with parents [\(self.parents.count)]"
//	}
//}
//
//class Becoming: Being {
//
//	func momentOfOccurrence() -> Nothing {
//		return Nothing(parents: parents, customDescription: "Moment of occurrence with parents: [\(parents.count - 1)]")
//	}
//
//	func momentOfArrival() -> Being {
//		return Being(parents: parents, customDescription: "Moment of arrival with parents: [\(self.parents.count - 1)]")
//	}
//
//	override func description() -> String {
//		return "Becoming with parents [\(self.parents.count - 1)]"
//	}
//}

//let buing = Being()


//let nothing = buing.think().think().think().think()
//
//print(buing.description())
//print(nothing.description())
//
//if let nothing = nothing as? Becoming {
//	print(nothing.momentOfArrival().description())
//}


class Foo {
	
}

class Bar: Foo {
	
}

let b = Bar()

print(b.)

print("ok")
