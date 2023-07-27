import Cocoa

/*----------------------------------- 1. How to create and use protocols -----------------------------------*/

// Protocols act like contacts for our code; they let us define what kind of functionality we expect our types to support. Protocols can be thought of as blueprints for classes or structs; they define an outline but not an implementation (similar to interfaces in Java).

// Below we define a protocol called Vehicle.
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    
    func estimateTravelTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// Next, we define a Car struct which conforms to Vehicle. Because it conforms, it must implement the two methods in Vehicle.
struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 4
    
    func estimateTravelTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    
    func openSunroof() {
        print("It's a nice day.")
    }
}
// A couple of notes about this example:
// 1. Although we use the same syntax that we use for inheritance, Car does not inherit from Vehicle. It conforms to it.
// 2. Every method declared in Vehicle must be implemented in Car.
// 3. We are allowed to add additional functionality which isn't included in Vehicle (openSunroof, for example).

// Let's now add some more structs that conform to Vehicle...
struct Bicycle: Vehicle {
    let name = "Bike"
    var currentPassengers = 1
    
    func estimateTravelTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

// Here's the useful part; we can now define a function that takes any object conforming to Vehicle, call Vehicle methods on it, and get different behavior based on the type of the object.
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTravelTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

// Protocols can also include variables, which can be declared as read/write, or just read. Read variables in a protocol must be declared as constants in any structs conforming to the protocol.
func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTravelTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km.")
    }
}

getTravelEstimates(using: [car, bike], distance: 150)

// Structs can conform to several protocols.
protocol CanBeElectric {}
struct Bus: Vehicle, CanBeElectric {
    let name = "Bus"
    var currentPassengers = 50

    func estimateTravelTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm bussing \(distance)km.")
    }
}

// If you ever need to inherit to a parent class and conform to a protocol, but the parent class(es) first and then the protocols.





/*----------------------------------------- 2. How to use opaque return types -----------------------------------------*/

// Int and Bool both conform to a protocol called Equatable. In the following two functions, we could easily return an Int and a Bool, respectively; but what if we wanted to be more general... What if we wanted to return an Equatable object? This can be done as follows...
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}





/*-------------------------------------- 3. How to create and use extensions --------------------------------------*/

// Extensions let us add functionality to any type. For example, we can define an extension on String containing a function that trims strings.
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
}

var quote = "   the truth is rarely pure and never simple     "
quote = quote.trimmed()
quote += "             "
quote.trim()

// You can also use extensions to add properties; however, these must be computed properties.
extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I've got this music in my mind
saying it's gonna be alright
"""

print(lyrics.lines.count)

// A struct's default, member-wise initializer will be preserved if a new custom initializer is defined inside of an extension.
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)





/*------------------------------------- 4. How to create and use protocol extensions -------------------------------------*/

// We can extend protocols using protocol extensions.
extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach", "Toad"]
if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

// Now imagine we wanted to do the same thing with sets and dictionaries. We could write the same extension for each, or we could extend the Collection protocol, which each one conforms to.
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

// Protocol-oriented programming: create a protocol and then define default implementations for its methods in an extension. These default implementations can either be used or overridden by conforming types.
protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)!")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()





/*----------------------------------- Summary: Protocols and extensions -----------------------------------*/

// Protocols are like contracts for code.
// Opaque return types let us hide some information in our code.
// Extensions let us add functionality to existing types.
// Protocol extensions let us add functionality to many types all at once.
