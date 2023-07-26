import Cocoa

/*------------------------------------ 1. How to limit access to internal data using access control ------------------------------------*/

// Sometimes we want to restrict access to certain properties and methods in a struct. We can do this using the private keyword.
struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        }
        return false
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)
if success {
    print("Withdrew money successfully.")
} else {
    print("Failed to withdraw money.")
}

// This can't be allowed!
// account.funds -= 1000

// A few access control levels are summarized below...
// 1. private: Don't let anything outside the struct use this.
// 2. fileprivate: Don't let anything outside the current file use this.
// 3. public: Let anyone, anywhere use this.
// 4. private(set): Let anyone read this property, but only internal methods can write to it.





/*----------------------------------------- 2. Static properties and methods -----------------------------------------*/

// Sometimes, you may want to add a property or method to a struct itself, not to an instance. This can be done using static.
struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)
// A couple of things to note here...
// 1. We didn't need to create an instance of School in order to call its static add method.
// 2. We didn't need to label the add method as mutating, even though it modifies studentCount.

// Some rules around static...
// 1. Static properties and methods cannot access non-static properties and methods.
// 2. Non-static properties and methods can access static properties and methods by using (for example) School.studentCount when outside of the struct, or Self.studentCount (upper-case S) when inside of the struct. Self (upper-case S) refers to the current TYPE of a struct, whereas self (lower-case S) refers to the current VALUE of a struct.
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "thisisusername", password: "12321")
}





/*------------------------------------------------------- 3. Summary: Structs -------------------------------------------------------*/

// You can create your own structs using the struct keyword.
// Structs can have their own properties and methods.
// If a method modifies properties of its struct, it must be mutating.
// Structs can have stored properties and computed properties.
// We can attach didSet and willSet property observers to properties.
// Swift generates an initializer for all structs using their property names.
// You can create custom initializers to override Swift's default.
// Access control limits what code can use properties and methods.
// Static properties and methods are attached directly to a struct.

