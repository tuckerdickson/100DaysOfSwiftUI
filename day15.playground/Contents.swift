import Cocoa

// MARK: Creating constants and variables
// Variables are created using the var keyword.
var name = "Ted"
name = "Rebecca"

// Constants are created using the let keyword and cannot be changed after initialization.
let user = "Daphne"
print(user)

// MARK: Strings
// Strings are enclosed in double quotes.
let actor = "Tom Cruise"

// Double quotes can be included in strings by prepending a \.
let quote = "He tapped a sign saying \"Believe\" and walked away."

// Swift also supports multi-line strings, which are enclosed in three double quotes.
let movie = """
A day in
the life of an
Apple engineer
"""

// Strings come with a collection of useful properties and methods.
print(actor.count)
print(quote.hasPrefix("He"))
print(quote.hasSuffix("Away."))

// MARK: Integers
// Integers are used to store whole numbers, and they support a whole range of mathematical operators.
let score = 10
let higherScore = score + 10
let halvedScore = score / 2

// Integers also support compound assignment, which allows us to modify them in place.
var counter = 10
counter += 5

// Like Strings, Integers also come with their own collection of useful methods and properties.
let number = 120
print(number.isMultiple(of: 3))

// We can create ranges of Integers.
let id = Int.random(in: 1...1000)

// MARK: Decimals
// Decimal numbers are represented by the Double type in Swift.
let decimal = 3.1
let anotherDecimal = 9.0

// MARK: Booleans
// Booleans store either true or false.
let goodDogs = true
let gameOver = false

// You can change a true value to false or vice versa using Boolean's toggle function.
var isSaved = false
isSaved.toggle()

// MARK: Joining strings
// String interpolation can be used to insert data inside of a String.
let name_ = "Taylor"
let age = 26
let message = "I'm \(name_) and I'm \(age) years old."

// MARK: Arrays
// Items can be grouped into arrays.
var colors = ["Red", "Green", "Blue"]
let numbers = [4, 8, 15, 16]
var readings = [0.1, 0.5, 0.8]

// Values can be read from arrays using indices.
print(colors[0])
print(readings[2])

// Variable arrays can be appended to using the append function.
colors.append("Purple")

// Items can be removed from an array using the remove function.
colors.remove(at: 0)

// You can check whether an array contains an element using the contains function.
print(colors.contains("orange"))

// MARK: Dictionaries
// Dictionaries store values using user-defined keys.
let employee = [
    "name": "Taylor",
    "job": "Singer"
]

// To read values from dictionaries, we use the same key names that we used when making the dictionary.
print(employee["job", default: "Unknown"])

// MARK: Sets
// Sets are similar to arrays, but they don't store duplicate items and aren't ordered.
var numberSet = Set([1, 1, 3, 7, 9])
print(numberSet)

// To add items to a set, we use the insert function.
numberSet.insert(10)

// Like arrays, sets also have a contains function.
print(numberSet.contains(1))

// MARK: Enums
// An enum is a set of user-defined, user-named values.
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .friday

// MARK: Type Annotations
// In certain situations, it may be helpful to explicity state the type of a piece of data.
var skore: Double = 0

// Below are the type annotations for all of the types we've learned so far.
let person: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.14
var isEnabled: Bool = true
var albums: Array<String> = ["Red", "Fearless"]
var socialUser: Dictionary<String, String> = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])

// Arrays and dictionaries have a special, slightly simpler type annotation.
var albumsEZ: [String]
var socialUserEZ: [String: String]

// An empty array can be made as follows...
var teams: [String] = [String]()

// Or, without the type annotation...
var teamsEZ = [String]()

// Enums have type annotation as well.
enum UIStyle {
    case light, dark, system
}
var style: UIStyle = .dark

// MARK: Conditions
// Conditional statements like if, else-if, else, direct the flow of a program based on user-specified conditions.
let voterAge = 16
if voterAge < 12 {
    print("You can't vote.")
} else if voterAge < 18 {
    print("You can vote soon.")
} else {
    print("You can vote now.")
}

let temp = 26
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

// MARK: Switch statements
// Switch statements are an alternative to if, else-if statements. They're particularly useful when you have a lot of cases that need to be checked.
enum Weather {
    case sun, rain, wind
}
let forecast = Weather.sun

switch forecast {
case .sun: print("It's a nice day.")
case .rain: print("Pack an umbrella.")
default: print("Should be okay.")
}

// MARK: The ternary conditional operator
// The ternary conditional operator can be thought of as a condensecd if-else statement, which returns one of two values based on a condition.
let voterAge2 = 19
let canVote = voterAge2 > 18 ? "Yes" : "No"

// MARK: Loops
// For loops run one loop for each item in a set, array, or dictionary, or across a specified range of Integers.
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]
for os in platforms {
    print("Swift works on \(os)")
}

for i in 1...12 {
    print("5 x \(i) = \(5 * i)")
}

// You can ignore the looping variable altogether by using an _.
var lyric = "Haters gonna"
for _ in 1...5 {
    lyric += " hate"
}
print(lyric)

// While loops run until a given condition is satisfied.
var count = 10
while count > 0 {
    print("\(count)...")
    count -= 1
}
print("Go!")

// Continue can be used to skip to the next loop iteration.
let files = ["me.jpg", "work.txt", "sophie.jpg"]
for file in files {
    if !file.hasSuffix(".jpg") {
        continue
    }
    print("Found picture: \(file)")
}
// Note: you can also exit the loop immediately using break.

// MARK: Functions
// Functions allow us to modularize code, which helps reduce repetition.
func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) = \(i * number)")
    }
}
printTimesTable(for: 8)

// If a function returns a value and only contains one line, the return keyword may be ommitted.
func rollDice() -> Int {
    Int.random(in: 1...6)
}
let result = rollDice()
print(result)

// MARK: Returning multiple values from functions
// Tuples can be used to return multiple values from a function.
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user2 = getUser()
print("Name: \(user2.firstName) \(user2.lastName)")

let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")

// MARK: Customizing parameter labels
// If you don't want a parameter label when calling a function, put an underscore before it.
func isUpperCase(_ string: String) -> Bool {
    string == string.uppercased()
}
let string = "HELLO WORLD"
let result2 = isUpperCase(string)

// Alternatively, you can specify an external parameter label, as well as an internal parameter label.
func printTimesTableWithLabel(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) = \(i * number)")
    }
}
printTimesTable(for: 5)

// MARK: Providing default values for parameters
// If you want, you can provide default values that parameters will take, unless specifically assigned in the function call.
func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)!")
    } else {
        print("Hi, \(person)!")
    }
}

greet("Tim", formal: true)
greet("Taylor")

// MARK: Handling errors in functions
// To handle errors in functions, you have to...
// 1. Define the kinds of errors that can occur,
enum PasswordError: Error {
    case short, obvious
}

// 2. Write a function that throws one or more of those errors,
func checkPassword(password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}

// 3. Call that function and handle its errors appropriately.
do {
    let result = try checkPassword(password: "12345")
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("Password is too obvious.")
} catch PasswordError.short {
    print("Password is too short.")
} catch {
    print("There was an unknown error.")
}

// MARK: Closures
// You can assign functionality directly to a variable or a constant as follows...
let sayHello = {
    print("Hi there!")
}
sayHello()
// Here, sayHello is called a closure; it's a chunk of code that we can pass around and call whenever we want to.

// Closures can accept parameters like so...
let sayHelloWithParams = { (name: String) -> String in
    "Hi, \(name)!"
}
print(sayHelloWithParams("world"))
// Note: by default, closures do not include parameter labels when calling them.

// Many of Swift's built-in functions accept closures as parameters.
let team = ["Gloria", "Suzy", "Tiffany", "Tasha"]
let onlyT = team.filter({ (name: String) -> Bool in
    name.hasPrefix("T")
})

// MARK: Trailing closures with shorthand syntax
// Swift includes a few tricks that make closures easier to read. For example, we could rewrite the previous filter call as...
let onlyT2 = team.filter { player in
    player.hasPrefix("T")
}

// We can even take it a step further and get rid of the parameter name altogether.
let onlyT3 = team.filter { $0.hasPrefix("T") }

// MARK: Structs
// Structs allow us to create our own data types, complete with properties and methods.
struct Album {
    let title: String
    let artist: String
    var isReleased = true
    
    func printSummary() {
        print("\(title) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift")
print(red.title)
red.printSummary()

// If you want to have a struct method change of the struct's properties, that method must be marked mutating.
struct MutatingAlbum {
    let title: String
    let artist: String
    var isReleased = true
    
    func printSummary() {
        print("\(title) by \(artist)")
    }
    
    mutating func removeFromSale() {
        isReleased = false
    }
}

// MARK: Computed properties
// A computed property calculates its value every time it's accessed.
struct EmployeeWithVacation {
    let name: String
    var vacationAllowed = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllowed - vacationTaken
        }
        
        set {
            vacationAllowed = vacationTaken + newValue
        }
    }
}

// MARK: Property observers
// Property observers are pieces of code that runs when a property changes. Two options exist...
// 1. didSet: called after the change has taken place, and
// 2. willSet: called before the change takes place.
struct Game {
    var score = 0 {
        didSet {
            print("Score is now: \(score)")
        }
    }
}
var game = Game()
game.score += 10
game.score -= 3

// MARK: Custom initializers
// Although Swift provides a default initializer in every struct, we can provide a custom initializer if we want to.
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

// MARK: Access control
// Swift has lots of options for access control, but four are the most common...
// 1. private: let nothing outside the struct read or write this.
// 2. private(set): let nothing outside the struct write, but they can read.
// 3. fileprivate: let nothing outside of the current file read or write this.
// 4. public: let anyone, anywhere read or write this.
struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

let account = BankAccount(funds: 100)
print(account.funds)

// MARK: Static properties and methods
// Static properties and methods belong to a Struct's type, rather than a particular instance of a Struct.
struct AppData {
    static let version = "1.3 beta 2"
    static let settingsFile = "settings.json"
}
print(AppData.version)
print(AppData.settingsFile)

// MARK: Classes
// Classes are very similar to Structs because they let us create our own custom data types. However, they differ in five key ways...
// 1. When we make a class, we can inherit from an existing class. The new class then gains all of the properties and methods that exist in the parent class.
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours per day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm coding for \(hours) hours per day.")
    }
    
    override func printSummary() {
        print("I spend \(hours) hours per day fighting with other developers.")
    }
}

let novall = Developer(hours: 8)
novall.work()
novall.printSummary()

// 2. Swift will never generate a default initializer for classes. Therefore, we have three rules for class initializers...
//      a. Classes will never generaate member-wise initializers.
//      b. Any initializer of a child class must call the parent class initializer.
//      c. If a child class has no custom initializer, it will inherit initializers from its parent.
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

// 3. All copies of a class instance share the same data (i.e., class instances are reference types).
class Actor {
    var name = "Nicolas Cage"
}

var actor1 = Actor()
var actor2 = actor1
actor2.name = "Tom Cruise"
print(actor1.name)
print(actor2.name)

// 4. Classes can have a deinitializer, which gets called when the last reference to an object is destroyed.
class Site {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Site \(id): I've been created.")
    }
    
    deinit {
        print("Site \(id): I've been destroyed.")
    }
}

for i in 1...3 {
    let site = Site(id: i)
    print("Site \(site.id): I'm in control.")
}

// 5. Classes let us change variable properties, even if the class instance itself is constant.
class Singer {
    var name = "Adele"
}

let singer = Singer()
singer.name = "Justin"
print(singer.name)
// Note: this means that class functions don't need to have the mutating keyword.

// MARK: Protocols
// Protocols define behavior that we expect other classes to exhibit. They sort of act like a blueprint for building classes.
protocol VehicleProtocol {
    var name: String { get }
    var currentPassengers: Int { get set }
    
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct CarConformer: VehicleProtocol {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    
    func openSunroof() {
        print("It's a nice day.")
    }
}

func commute(distance: Int, using vehicle: VehicleProtocol) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}
 
let car = CarConformer()
commute(distance: 100, using: car)

// MARK: Extensions
// Extensions let us add new functionality to any kind of type.
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var quote2 = "     The truth is rarely pure and never simple    "
let trimmed = quote2.trimmed()
print(quote)

quote2.trim()
print(quote2)

let lyrics = """
But I keep moving
Can't stop, won't stop moving
"""
print(lyrics.lines.count)

// MARK: Protocol extensions
// Protocol extensions let us add computed properties and methods to a whole protocol. In the following example, we add a property to the Collection protocol, which is adopted by Array, Set, and Dictionary.
extension Collection {
    var isNotEmpty: Bool {
        !self.isEmpty
    }
}

let guests = ["Mario", "Luigi", "Peach"]
if guests.isNotEmpty {
    print("Guest count is \(guests.count)")
}

// MARK: Optionals
// Optionals represent the absense of data.
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]
let peachOpposite = opposites["Peach"]

// If let is one way of unwrapping (i.e., peeking inside) optionals. The body of an if let is executed in the absense of a nil.
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

// Guard let is another way of unwrapping optionals. Unlike if let, the body of a guard let is executed in the presence of a nil.
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input.")
        return
    }
    
    print("\(number) x \(number) = \(number * number)")
}

// The third and final way of unwrapping optionals is by using nil coalescing. This method provides a default value for the variable to assume in the case of a nil.
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

let input = ""
let number3 = Int(input) ?? 0
print(number3)

// MARK: Optional chaining
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "no one.")")

// MARK: Optional try?
// When evaluating a function that might throw an error, we can use an optional try to convert any errors into an optional nil.
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User is \(user)")
}
