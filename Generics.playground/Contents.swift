//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Generics"

// 0 Write a name inside angle brackets to make a generic function or type.

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] { // 居然用Item这种不定义的类型。灵活性很突出。有点怕怕的。
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes:4)
makeArray(repeating: 4, numberOfTimes: 4)
makeArray(repeating: 3.5, numberOfTimes: 4)

// 1 You can make generic forms of functions and methods, as well as classes, enumerations, and structures.

// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
print(possibleInteger)

possibleInteger = .some(100)

// 2 Where
// Use where right before the body to specify a list of requirements, for example,
//      to require the type to implement a protocol,
//      to require two types to be the same, 
//      or to require a class to have a particular superclass.

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 2, 3], [3])

// EXPERIMENT: Modify the anyCommonElements(_:_:) function to make a function that returns an array of the elements that any two sequences have in common.

// Writing <T: Equatable> is the same as writing <T> ... where T: Equatable>.
func arrayOfCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Iterator.Element]
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        var result: [T.Iterator.Element] = []
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    result.append(lhsItem)
                }
            }
        }
        return result
}
arrayOfCommonElements([1, 2, 6789, 3], [3,4,6789])
