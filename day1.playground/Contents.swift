import Cocoa

/*------------------------------- 4. How to create variables and constants -------------------------------*/

// Use the var keyword to create variables.
var greeting = "Hello, playground"

// The value of variables can change.
var name = "Ted"
name = "Rebecca"
name = "Keeley"

// Use the let keyword to create constants. The value of a constant cannot change.
let character = "Daphne"

// Use the print function to print the value of a variable or constant.
var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

// Camel-case is a common coding convention used when naming variables/constants.
let managerName = "Michael"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"





/*------------------------------- 5. How to create strings -------------------------------*/

// Strings can be created in Swift using double-quotes.
let actor = "Denzel Washington"
let filename = "paris.jpg"

// Strings can contain emojis (Edit -> Emojis & Symbols).
let result = "⭐️ You win! ⭐️"

// Strings can also contain double-quotes within them.
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

// Multi-line strings require three sets of double-quotes (the quotes must be on their own lines).
let movie = """
A day in
the life of
an Apple engineer
"""

// You can get the length of a string using the count property.
print(actor.count)

// Upper-case versions of strings can be obtained using the uppercased function.
print(result.uppercased())

// Use the hasPrefix function to determine whether a string begins with a specific substring.
print(movie.hasPrefix("A day"))

// Similarly, use the hasSuffix function for the end of a string.
print(filename.hasSuffix(".jpg"))

// Note that strings are case-sensitive in Swift.
print(filename.hasSuffix(".Jpg"))





/*------------------------------- 5. How to store whole numbers -------------------------------*/

// Making a new integer is much like making a new string.
let score = 10

// Underscores can be used to make long numbers more readable.
let reallyBig = 100_000_000

// Numbers can also be created using standard arithmetic operators (+, -, *, /).
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let halvedScore = score / 2

// By using variables, we can avoid creating new constants every time we want to modify a value.
var counter = 10
counter = counter + 5

// We can rewrite the above line using a shorthand notation.
counter += 5

// These so-called compound assignment operators can be used for operations other than addition.
counter *= 2
counter -= 10
counter /= 2

// Use the isMultiple function to determine whether a number is a multiple of another number.
let number = 120
print(number.isMultiple(of: 3))





/*------------------------------- 5. How to store decimal numbers -------------------------------*/

// Decimal (or "floating-point") numbers are notorious for causing problems in programs.
print(0.1 + 0.2)

// Integers cannot be combined with doubles in swift.
let a = 1
let b = 2.0
// let c = a + b            // <- This causes an error

// To add a and b, we need to cast one of them to the type of the other.
let c = Double(a) + b
let d = a + Int(b)

// Swift infers the type of a numeric value based on the presense (or absense) of a decimal point.
let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

// Once Swift has determined the type of a variable, the type of that variable cannot change
var name2 = "Nicolas Cage"
// name2 = 57               // <- Error!

// Doubles have the same range of operators and compound assignment operators as integers.
var rating = 5.0
rating *= 2.0
