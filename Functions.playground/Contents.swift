//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Functions and Closures!"

// 1  
//Use -> to separate the parameter names and types from the function’s return type.
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

//EXPERIMENT
//Remove the day parameter. Add a parameter to include today’s lunch special in the greeting.
func promtLunch(person: String, todayLunchSpecial: String) -> String {
    return "Hello \(person), today’s lunch special  is \(todayLunchSpecial)."
}
promtLunch(person: "Bob", todayLunchSpecial: "Tuesday")

// 2 argument label
//By default, functions use their parameter names as labels for their arguments. Write a custom argument label before the parameter name, or write _ to use no argument label.
func greet2(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet2("John", on: "Wednesday")

// 3 tuple as argument
// Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.
func calculateStatistics(scores: [Int]) -> (min:Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.max)
print(statistics.1)

// 4 take arguments (uncertain counts. )
// Functions can also take a variable number of arguments, collecting them into an array.
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers:)
sumOf(numbers: 42, 59, 666)

//EXPERIMENT: Write a function that calculates the average of its arguments.
func averageOf(numbers: Double...) -> Double {
    var sum = 0.0
    for number in numbers {
        sum += number
    }
    return sum/Double(numbers.count)
}
averageOf(numbers: 12.3, 12, 12.4, 12.1)

// 5 nested Functions
// Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// 6 Functions as a first-class type.
// This means that a function can return another function as its value.
func makeIncrementer(step: Int) -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return step + number
    }
    return addOne
}
var increment = makeIncrementer(step: 3)
increment(7)

// 6.2 A function can take another function as one of its arguments.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)
