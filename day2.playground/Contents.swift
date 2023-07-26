import Cocoa

/*----------------------------- 1. How to store truth with booleans -----------------------------*/

// Booleans are variables that contain either true or false
let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 7))

// These values can be assigned directly...
let goodDogs = true
let gameOver = false

// ... or using expressions
let isMultiple = 120.isMultiple(of: 3)

// Booleans can be negated using an exclamation mark.
var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// Alternatively, you can use the toggle function to negate a boolean.
isAuthenticated.toggle()
print(isAuthenticated)





/*----------------------------- 1. How to join strings together -----------------------------*/

// Two strings can be joined together using a plus sign in Swift.
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

// You can use several plus signs to join several strings.
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action

// String interpolation can be used to insert data (strings or otherwise) into strings.
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I am \(age) years old."

// In order to use the plus sign to join a string and an integer, the integer must be cast to a string.
let number2 = 11
let missionMessage = "Apollo " + String(number2) + " landed on the moon."

// String interpolations can also include expressions.
print("5 x 5 is \(5*5)")





/*----------------------------- 3. Summary: Simple Data -----------------------------*/

// Swift lets us create constants using let and variables using var.
// Swift's strings contain text, from short strings up to whole novels.
// You create strings by using double quotes at the start and end.
// Swift calls its whole numbers integers, or Int.
// In swift decimal numbers are called Double.
// You can store a simple true or false using a boolean, or Bool.
// String interpolation lets us place data into strings efficiently.

