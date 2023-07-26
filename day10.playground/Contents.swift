import Cocoa


/*------------------------------------ 1. How to create your own structs ------------------------------------*/

// Structs allow us to create our own custom data types, complete with their own properties and methods.
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

// By default, Swift doesn't allow properties to be changed in a struct. In order to change them in a method, we need to label that method as mutating.
struct Employee {
    let name: String
    var vacationRemaining = 14
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("There aren't enough vacation days remaining.")
        }
    }
}

// Since we will be changing one of the Employee properties, Employees need to be variables, not constants.
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
// By calling Employee(), we are invoking Employee's initializer (Employee.init()) and creating an instance of the Employee struct.





/*------------------------------ 2. How to compute property values dynamically ------------------------------*/

// The properties we've seen so far have been stored properties, they're placed into the struct directly.
// Swift also has computed properties, whose values are recalculated every time they're accessed.
struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    // Calculated dynamically
    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}

var archer2 = Employee2(name: "Sterling Archer")
print(archer2.vacationRemaining)
archer2.vacationTaken += 4
print(archer2.vacationRemaining)

// It isn't always clear what it means to assign a computer property a value, so we can define a setter to specify.
struct Employee3 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    // Calculated dynamically
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}





/*------------------------------- 3. How to take action when a property changes -------------------------------*/

// Property observers are special pieces of code that run whenever a property's value changes.
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

// The didSet property observer runs after the property is changed, while willSet runs before.
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was: \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")




/*------------------------------------ 4. How to create custom initializers ------------------------------------*/

// Initializers are special functions in structs, designed to create initial values for the struct's properties.
struct Player {
    let name: String
    let number: Int
}

// Here, we use Swift's built-in, hidden initializer to create a player.
let player = Player(name: "Megan R", number: 15)

// If we want, we can define our own initializer. Here, we create a simple member-wise initializer.
struct Player2 {
    let name: String
    let number: Int
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

// However, we can modify our initializers to make them more interesting.
struct Player3 {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player3 = Player3(name: "Megan R.")
print(player3.number)
// Note: once a custom initializer is defined, Swift's default initializer is no longer usable (unless the new initializer is defined in an extension).
// Note: when defining initializers, remember the golden rule: all properties must be initialized.
