import Cocoa

// Write a function that accepts an optional array of integers and returns one of those integers randomly.
// If the array is missing or empty, return a new random number in the range 1 through 100.
// Write this function in a single line of code.

func randomInt(in array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}
