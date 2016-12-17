//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: - 0 Hello World
print("Hello World!")
// You don’t need to import a separate library for functionality like input/output or string handling. Code written at global scope is used as the entry point for the program, so you don’t need a main() function. 
// For the best experience, open this chapter as a playground in Xcode. Playgrounds allow you to edit the code listings and see the result immediately.
// FIXME: how to "open this chapter as a playground in Xcode"? Something miracle?

// MARK: - 1 Simple Values
// Use let to make a constant and var to make a variable. The value of a constant doesn’t need to be known at compile time, but you must assign it a value exactly once. This means you can use constants to name a value that you determine once but use in many places.

var myVariable = 42
myVariable = 50
let myConstant = 40

// MARK: compiler infers
// A constant or variable must have the same type as the value you want to assign to it. However, you don’t always have to write the type explicitly. Providing a value when you create a constant or variable lets the compiler infer its type. In the example above, the compiler infers that myVariable is an integer because its initial value is an integer.
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

// EXPERIMENT
//Create a constant with an explicit type of Float and a value of 4.
let explicitDouble4: Double = 4

// MARK: Implicitly Type Conversion: Never.
// Values are never implicitly converted to another type. If you need to convert a value to a different type, explicitly make an instance of the desired type.
let label = "The width is "
let width = 94
//let widthLabel = label + width

// Warning: Binary operator '+' cannot be applied to operands of type 'String' and 'Int'
let widthLabel = label + String(width)

// MARK: Value included in String
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + oranges) pieces of fruit."


//EXPERIMENT
//Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.
let goldCount = 4.5
let gamePlayerGreeting = "Hello, you have \(goldCount) gold. Enjoy your game."

// MARK: arrays and dictionaries
//Create arrays and dictionaries using brackets ([]), and access their elements by writing the index or key in brackets. A comma is allowed after the last element.
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylle": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
// To create an empty array or dictionary, use the initializer syntax.
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
// If type information can be inferred, you can write an empty array as [] and an empty dictionary as [:]—for example, when you set a new value for a variable or pass an argument to a function.
shoppingList = []
occupations = [:]