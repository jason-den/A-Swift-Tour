//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Objects and Classes"

// 1 Creation: Use class followed by the class’s name to create a class. (declaraion)
// A property declaration in a class is written the same way as a constant or variable declaration, except that 
//      it is in the context of a class.
//      Likewise, method and function declarations are written the same way.
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    let color = UIColor.blue
    func simpleDescription(color: UIColor) -> String {
        return "A shape with \(numberOfSides) sides. And \(color.description) color"
    }
}

// EXPERIMENT: Add a constant property with let, and add another method that takes an argument.

// 2 instanciation
// Create an instance of a class by putting parentheses after the class name. Use dot syntax to access the properties and methods of the instance.
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
var shapeDescription2 = shape.simpleDescription(color: UIColor.yellow)

// 3 initializer
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    var lineWidth: Int = 3
    
    init(name: String) {
        self.name = name
    }
    init(lineWidth: Int, name: String) {
        self.name = name
        self.lineWidth = lineWidth
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
//      Notice how self is used to distinguish the name property from the name argument to the initializer.

//      Every property needs a value assigned -- either in its declaration (as with numberOfSides) or in the initializer (as with name).

//      Use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated.


// 4 Subclasses
//  4.1 Subclasses include their superclass name after their class name, separated by a colon.
//      There is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.

// 5 Override & the sweet complier feature
//      Methods on a subclass that override the superclass’s implementation are marked with override—overriding a method by accident, without override, is detected by the compiler as an error.
//      The compiler also detects methods with override that don’t actually override any method in the superclass.

class Square: NamedShape {  // 4.1
    
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() ->  Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String { // 5
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

//EXPERIMENT: 
//      Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer.
//      Implement an area() and a simpleDescription() method on the Circle class.

class Circle: NamedShape {

    var radius: Double

    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 0
    }
    func area() -> Double {
        return M_PI * radius * radius
    }
    override func simpleDescription() -> String { // 5
        return "A circle with radius \(radius)."
    }
}

let circle2 = Circle(radius: 2, name: "my test circle")
circle2.area()
circle2.simpleDescription()

// 6 getter and a setter.
//      In addition to simple properties that are stored, properties can have a getter and a setter.
class EquilateralTriangle: NamedShape { // 等边三角形
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double { // 周长
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// 6+ newValue: implicitly the new value in setter
//      In the setter for perimeter, the new value has the implicit name newValue. You can provide an explicit name in parentheses after set.


// 7 willSet & didSet
// If you don’t need to compute the property but still need to provide code that is run before and after setting a new value, use willSet and didSet.

// The code you provide is run any time the value changes outside of an initializer. For example, the class below ensures that the side length of its triangle is always the same as the side length of its square.
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)


// 8 ? before operations like methods, properties, and subscripting

//      When working with optional values, you can write ? before operations like methods, properties, and subscripting. If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil. Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value. In both cases, the value of the whole expression is an optional value.
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
