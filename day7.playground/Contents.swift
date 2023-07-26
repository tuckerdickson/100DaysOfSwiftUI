import Cocoa

/*----------------------------- 1. How to reuse code with functions -----------------------------*/

// Functions can be used to modularize code, so that it can be easily reused.
func showWelcome() {
    print("Welcome to my app!")
}

print("Calling function...")
showWelcome()

// Functions can contain parameters, which allow us to vary their behavior.
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) = \(i*number)")
    }
}

printTimesTables(number: 5, end: 20)
// Note: "number" and "end" in the function definition are called parameters,
//          while "number: 5" and "end: 20" in the function call are arguments.





/*----------------------------- 2. How to return values from functions -----------------------------*/

// Sometimes it's useful for a function to pass some data back to the caller.
let root = sqrt(169)

// We can make our functions return a value using the following syntax.
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()

// Example: do two strings contain the same letters, regardless of their order?
func areSameLetters(for string1: String, and string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

areSameLetters(for: "cat", and: "act")
areSameLetters(for: "tab", and: "beer")
// Note: when you define a function that only has one line, you can omit the return keyword.

// Example: given two side lengths of a right triangle, return the length of the hypotenuse.
func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)

// Even if a function does not return a value, you can still call return to exit the function.
func sayHello() {
    return
}





/*------------------------ 3. How to return multiple values from functions ------------------------*/

// Sometimes we want to return multiple values from a function. One way to do this is using an array.
func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])")

// You could also use a dictionary...
func getUser2() -> [String: String] {
    ["firstName": "Taylor", "lastName": "Swift"]
}

let user2 = getUser2()
print("Name: \(user2["firstName", default: "?"]) \(user2["lastName", default: "?"])")

// Both of these solutions are messy and prone to error. A better way is to use a tuple.
func getUser3() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let user3 = getUser3()
print("Name: \(user3.firstName) \(user3.lastName)")

// Alternatively, you could return a tuple without any labels.
func getUser4() -> (String, String) {
    ("Taylor", "Swift")
}

let user4 = getUser4()
print("Name: \(user4.0) \(user4.1)")

// Before we were assigning the result to a tuple. We can instead pull apart the tuple right away.
let (firstName, lastName) = getUser3()
print("Name: \(firstName) \(lastName)")





/*------------------------------ 4. How to customize parameter labels ------------------------------*/

// In Swift, functions can be overloaded by varying the parameter name(s).
func hireEmployee(name: String) {}
func hireEmployee(title: String) {}
func hireEmployee(location: String) {}

// We can actually include two parameter names, one outward-facing and one inward-facing.
func getUsername(for user: String) -> String {
    return "@\(user)"
}
getUsername(for: "twostraws")

func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(i) * \(number) = \(i*number)")
    }
}
printTimesTable(for: 5)

// If we don't want an argument labeled during a function call, we can put an _ in the definition.
func isUpper(_ string: String) -> Bool {
    return string == string.uppercased()
}

let string = "HELLO, WORLD"
let result2 = isUpper(string)
