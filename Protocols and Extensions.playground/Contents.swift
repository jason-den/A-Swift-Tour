//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Protocols and Extensions"

//// Protocols
// 1 Use protocol to declare a protocol.

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
// 2 Classes, enumerations, and structs can all adopt protocols.

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() { // no "mutating"
        simpleDescription += "  Now 100% adjusted."
    }
}
var simpleClass = SimpleClass()
simpleClass.adjust()
let aDescription = simpleClass.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() { // use "mutating" to mark a method that modifies the structure.
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//EXPERIMENT: Write an enumeration that conforms to this protocol.
enum SimpleEnumeration: ExampleProtocol {
    case Base, Adjusted
    
    var simpleDescription: String {
        return self.getDescription()
    }
    
    mutating func adjust() { // use "mutating" to mark a method that modifies the enumeration
        self = .Adjusted
    }
    
    func getDescription() -> String {
        switch self {
        case .Base:
            return "A simple description of enum"
        case .Adjusted:
            return "A adjusted description of enum"
        }
    }
}
var c = SimpleEnumeration.Base
c.adjust()
let cDescription = c.simpleDescription

// 3 mutating keyword
// Notice that a method that modifies the structure/enumeration it self, need to be mark as mutating.
//      The declaration of SimpleClass doesn’t need any of its methods marked as mutating because methods on a class can always modify the class.



//// Extensions

// 0 Use extension to add functionality to an existing type, such as new methods and computed properties.
//      You can use an extension to add protocol conformance(一致性) to a type that is declared elsewhere, or even to a type that you imported from a library or framework.
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
// 7.adjust()  // Uncomment to see the error: Cannot use mutating member on immutable value: literals are not mutable

// EXPERIMENT: Write an extension for the Double type that adds an absoluteValue property.
extension Double {
    var absoluteValue: Double {
        return self >= 0 ? self : (-self)
    }
}
print(-10.5.absoluteValue) // hehe
print((-10.5).absoluteValue)

// You can use a protocol name just like any other named type—for example, to create a collection of objects that have different types but that all conform to a single protocol. When you work with values whose type is a protocol type, methods outside the protocol definition are not available.

var protocolValue: ExampleProtocol = simpleClass
print(protocolValue.simpleDescription)
print(protocolValue.adjust())  // Uncomment to see the error
print(protocolValue.simpleDescription)
// Even though the variable protocolValue has a runtime type of SimpleClass, the compiler treats it as the given type of ExampleProtocol. This means that you can’t accidentally access methods or properties that the class implements in addition to its protocol conformance.

