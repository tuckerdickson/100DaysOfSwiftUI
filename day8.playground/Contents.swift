import Cocoa

/*------------------------- 1. How to provide default values for parameters -------------------------*/

// Sometimes we want to provide a sensible default parameter, in the case that the user doesn't provide one.
func printTimesTable(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTable(for: 5, end: 20)
printTimesTable(for: 8)

// One example of a built-in function with a default parameter is the removeAll function (param. keepingCapacity).
var characters = ["Lana", "Ray", "Pam", "Dillon"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)
// By default, Swift frees memory when an array is cleared. By setting keepingCapacity, memory is maintained.





/*----------------------------------- 2. How to handle errors in functions -----------------------------------*/

// Sometimes unexpected errors arise in functions. These errors are handles in three steps...
// Step 1: define the kinds of problems that can occur inside our function.
enum PasswordError: Error {
    case short
    case obvious
}

// Step 2: write a function that triggers one or more of those errors.
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        return "Ok"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Great"
    }
}

// Step 3: call the trigger function and handle any resulting errors. In SwiftUI, this looks something like...
//  do {
//      try someRiskyWork()
//  } catch {
//      print("Handle errors here")
//  }
let string = "12345"
do {
    let result = try checkPassword(string)
    print("Rating: \(result)")
} catch {
    print("There was an error.")
}

// In a HANDFUL OF CASES, the do and catch can be omitted by putting an ! after try. However, THIS IS DANGEROUS.
// let result = try! checkPassword(string)
// print("Rating: \(result)")

// We can be more specific about how to handle specific types of errors.
do {
    let result = try checkPassword(string)
    print("Rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage.")
} catch {
    "There was an error: \(error.localizedDescription)"
}
// Note: the last catch block acts as a catch-all.





/*---------------------------------------- 3. Summary: Functions ----------------------------------------*/

// Functions reuse code by carving off chunks and giving it a name.
// Functions start with the keyword func, followed by the function's name.
// Functions can accept parameters to control their behavior.
// You can add custom, external parameter names, or use _ to skip one.
// Function parameters can have default values for common scenarios.
// Functions can optionally return a value, but you can return multiple pieces of data from a function using a tuple.
// Functions can throw errors using do, try, and catch.

