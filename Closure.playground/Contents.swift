//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Functions are actually a special case of closures: blocks of code that can be called later.
// The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions.
// You can write a closure without a name by surrounding code with braces ({}).
// Use in to separate the arguments and return type from the body.

var numbers = [20, 19, 7, 12]

// 1. map closure exmaple
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})


// EXPERIMENT: Rewrite the closure to return zero for all odd numbers.
numbers.map({
    (number: Int) -> Bool in
    return number % 2 == 0
})

// 2 implicitly return value of Single statement
/*
 You have several options for writing closures more concisely.
 When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both.
 Single statement closures implicitly return the value of their only statement.
 */
let mappedNumbers = numbers.map({ number in 3 * number })
let mappedNumbers2 = numbers.map({ $0 * 3 })
print(mappedNumbers, mappedNumbers2)

// 3 Closure parameters refer
// 3.1 You can refer to parameters by number instead of by name—this approach is especially useful in very short closures.
// 3.2 A closure passed as the last argument to a function can appear immediately after the parentheses.
// 3.3 omit the parentheses:
//    When a closure is the only argument to a function, you can omit the parentheses
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)