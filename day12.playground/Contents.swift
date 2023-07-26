import Cocoa

/*----------------------------------------- 1. How to create your own classes-----------------------------------------*/

// Classes are another way to create custom data types. They are similar to structs in the following ways...
// 1. You can create and name them.
// 2. You can add properties, methods, property observers, and access control.
// 3. You can create custom initializers to configure new instances.
//
// However, classes also differ from structs in a few key ways...
// 1. You can make one class build upon functionality from another class (inheritance).
// 2. Swift will not automatically generate a memberwise initializer for classes.
// 3. If you copy an instance of a class, both copies share the same data.
// 4. We can add a deinitializer to run when the final copy is destroyed (this frees allocated memory).
// 5. Constant class instances can have their variable properties changed.

// Swift classes can be created as follows...
class Game {
    var score = 0 {
        didSet {
            print("Score is now: \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10





/*--------------------------------- 2. How to make one class inherit from another ---------------------------------*/

// Swift let's us create classes by basing them on existing classes in a process known as inheritance. The new class gets all of the properties and methods from the existing class. In the example below, Developer and Manager both inherit from Employee.
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times will argue for hours whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joe = Manager(hours: 10)
// Note: Developer and Manager both inherit the hours property from Employee.

// The proper version of work will be called automatically.
robert.work()
joe.work()

// Both Developer and Manager also inherit any functions defined in Employee.
let novall = Manager(hours: 8)
novall.printSummary()

// But what if we want to customize a method defined in the base class? We can use override to do this.
let kyle = Developer(hours: 10)
kyle.printSummary()
// Note: you only need to use ovdrride if the functions name, parameters, and return value are the same. If any of those differ, override is unnecessary.

// The keyword final can be used to tell Swift that a class should not be inherited from. It can inherit from other classes itself.
final class Salesman: Employee {}





/*------------------------------------------- 3. How to add initializers for classes -------------------------------------------*/

// In Swift, if a child class has any custom initializers, it must always call the parents' initializers using super.init().
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

let teslaX = Car(isElectric: true, isConvertible: false)

// If a child class does not have any initializers, it will automatically inherit the initializers of the parent class.
class Truck: Vehicle {
    let isConvertible = false
}

let cyberTruck = Truck(isElectric: true)





/*------------------------------------------- 4. How to copy classes -------------------------------------------*/

// By default, class instances that are copied are shallow; that is, the new instance shares the same data as the old one.
class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1
user2.username = "Taylor"

print(user1.username)
print(user2.username)

// However, if you want to create a deep copy, there are ways around this.
var user3 = User()
var user4 = user3.copy()
user4.username = "Taylor"

print(user3.username)
print(user4.username)





/*--------------------------------------- 5. How to create a deinitializer for a class ---------------------------------------*/

// If you want, you can give a class a deinitializer, which gets called when an object is destroyed. A few deinitializer rules...
// 1. You don't use func with deinitializers
// 2. Deinitializers can never take parameters or return data.
// 3. Deinitializers run when the last copy of a class instance is destroyed.
// 4. We never call deinitializers directly.
// 5. Structs do not have deinitializers.

// The example class below contains a deinitializer...
class User2 {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead." )
    }
}

// In the following example, each user is destroyed at the end of each iteration.
for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control!")
}
print("First loop is finished.")

// In this example, users are stored in an array, so they aren't destroyed until the array is cleared.
var users = [User2]()
for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}
print("Second loop is finished.")
users.removeAll()
print("Array is cleared.")





/*--------------------------------------- 6. How to work with variables inside classes ---------------------------------------*/

// By declaring class instances as variables, we can allow them to refer to different instances of the class.
class User3 {
    var name = "Paul"
}

var user = User3()
user.name = "Taylor"
user = User3()
print(user.name)

// This leaves us with four cases...
// 1. Constant class, constant properties: a signpost that always points to the same user, which always has the same name.
// 2. Constant class, variable properties: a signpost that always points to the same user, but their name can change.
// 3. Variable class, constant properties: a signpost that can point to different users, whose names can't change.
// 4. Variable class, variable properties: a signpost that can point to different users, and their names can change.
//
// Class methods that modify class properties do not need to include the mutating keyword.





/*-------------------------------------------- 7. Summary: Classes --------------------------------------------*/

// Classes have lots of things in common with structs.
// Classes can inherit from other classes, so they get access to the properties and methods of their parent.
// Swift does not generate a memberwise initializer for classes.
// Copies of a class instance point to the same instance.
// Classes run deinitializers when the last copy of an instance is destroyed.
// You can change variable properties inside constant class instances. 
