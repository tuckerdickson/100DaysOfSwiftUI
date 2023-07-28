import Cocoa

/*------------------------------------ 1. How to handle missing data with optionals ------------------------------------*/

// An optional variable is one which might have a value, but might not. In the following example, peachOpposite has type String? (optional string), and its value becomes nil, because opposites does not contain "Peach".
let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"]
print(type(of: peachOpposite))

// Swift likes to be predictable, so it doesn't allow us to treat optional data as regular data. In order to use an optional, we need to first unwrap it (check to see if it's nil). This can be done in a few different ways, one of which is an if let.
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil
if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

// Optional types are DIFFERENT than definite types. An Int is not the same thing as an Int?. Therefore, if a function accepts an Int, we must give it an Int, not an Int?.
func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
if let number = number {
    print(square(number: number))
}
// Note, it's very common to use the original variable name in an if let statement. This practice is called shadowing.





/*-------------------------------------- 2. How to unwrap optionals with guard --------------------------------------*/

// Like if let, guards can be used to unwrap optionals. Unlike if let, the body of a guard is triggered by a nil.
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input.")
        return
    }
    
    print("\(number) x \(number) = \(number * number)")
}

// A few rules when using guards...
// 1. Swift requires you to return if a guard check fails.
// 2. If the optional you're unwrapping has a value, you can use it after the guard code finishes.





/*------------------------------------- 3. How to unwrap optionals with nil coalescing -------------------------------------*/

// The nil coalescing operator (??) is a third way of unwrapping optionals in Swift. It does this by allowing a default value in the case of a nil.
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]
let new = captains["Serenity"] ?? "NA"

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}
let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"

let input = ""
let number2 = Int(input) ?? 0





/*----------------------------- 4. How to handle multiple optionals using optional chaining -----------------------------*/

// Optional chaning means "if the optional has a value inside, unwrap it and then do something."
let names = ["Arya", "Bran", "Rob", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

var book2: Book? = nil
var author2 = book2?.author?.first?.uppercased() ?? "A"
print(author2)





/*---------------------------------- 5. How to handle function failure with optionals ----------------------------------*/

// When calling functions that may throw errors, we can use an optional try.
enum UserError: Error {
    case badID, networkFailed
}

func getUserID(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUserID(id: 23) {
    print("User: \(user)")
}
// Here, the optional try makes getUserID return not a string, but an optional string, which will be nil if any error was thrown inside the function. If we don't want user to be nil, we can use coalescing as follows...
let user2 = (try? getUserID(id: 23)) ?? "Anonymous"





/*------------------------------------- 6. Summary: Optionals -------------------------------------*/

// Optionals allow us to represent the absence of data.
// Everything that isn't optional definitely has a value.
// Unwrapping looks inside an optional: if there's a value, it's sent back.
// If let runs some code if the optional has a value; guard let runs code if the optional is nil.
// The nil coalescing operator ?? unwraps and returns an optional's value, or a default value instead.
// Optional chaning reads an optional inside another optional.
// Try? can convert throwing functions so they return an optional.

