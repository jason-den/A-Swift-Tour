//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Enumerations and Structures"

// 0 Use enum to create an enumeration. 
//      Like classes and all other named types, enumerations can have methods associated with them. (WOW, impressive)

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    func compareRank(rank: Rank) -> CompareResult {
        if self.rawValue < rank.rawValue {
            return CompareResult.less
        } else if self.rawValue > rank.rawValue {
            return CompareResult.bigger
        } else {
            return CompareResult.equal
        }
    }
    enum CompareResult: Int {
        case less = -1
        case equal
        case bigger
    }
}
let ace = Rank.ace
let aceRawValue = ace.simpleDescription()
//EXPERIMENT:       Write a function that compares two Rank values by comparing their raw values.
let jack = Rank.jack
let queen = Rank.queen
ace.compareRank(rank: jack)
queen.compareRank(rank: jack)
queen.compareRank(rank: queen)

// 1 raw value
// By default, Swift assigns the raw values starting at zero and incrementing by one each time, but you can change this behavior by explicitly specifying values. In the example above, Ace is explicitly given a raw value of 1, and the rest of the raw values are assigned in order. You can also use strings or floating-point numbers as the raw type of an enumeration. Use the rawValue property to access the raw value of an enumeration case.


//      Use the init?(rawValue:) initializer to make an instance of an enumeration from a raw value.
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

// 2 case values
//      The case values of an enumeration are actual values, not just another way of writing their raw values. 
//      In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.
enum Suit: Int {
    case spades = 1
    case hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades: // ♠️
            return "spades"
        case .hearts:
            return "hearts" // ♥️
        case .diamonds:
            return "diamonds" // ♦️
        case .clubs:
            return "clubs" // ♣️
        }
    }
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

// EXPERIMENT:      Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.


// 3 abbreviated form: refering case inside of enumeration.

// 4 cases values associated with the case MARK: 尼玛这个点好像很厉害，还没见过。希望能遇到demo里边用到它
// If an enumeration has raw values, those values are determined as part of the declaration, which means every instance of a particular enumeration case always has the same raw value.
//      Another choice for enumeration cases is to have values associated with the case -- these values are determined when you make the instance, and they can be different for each instance of an enumeration case.
//      You can think of the associated values as behaving like stored properties of the enumeration case instance. 

//          For example, consider the case of requesting the sunrise and sunset times from a server. The server either responds with the requested information, or it responds with a description of what went wrong.

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failureExample = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}

switch failureExample {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}

// Notice how the sunrise and sunset times are extracted from the ServerResponse value as part of matching the value against the switch cases.

//// Structure
// 0 creation
//      Use struct to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. 
//      One of the most important differences between structures and classes is that structures are always **copied** when they are passed around in your code, but classes are passed by reference.
//          But I remember that, Standford iOS9, teacher might say sth, different. FIXME: Comfirm what it is.

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    // EXPERIMENT: Add a method to Card that creates a full deck of cards, with one card of each combination of rank and suit.
    static func deck() -> [Card] {
        var deck = [Card]()
        var suitCount = 1
        while let suit = Suit(rawValue: suitCount) {
            var rankCount = 1
            while let rank = Rank(rawValue: rankCount) {
                deck.append(Card(rank: rank, suit: suit))
                rankCount += 1
            }
            suitCount += 1
        }
        return deck
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

let fullDeck = Card.deck()
print(fullDeck)