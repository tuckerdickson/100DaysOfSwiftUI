import Cocoa

// Create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.

var strings = ["this", "is", "an", "array", "of", "strings", "this", "is", "a", "string"]

print("Total items: \(strings.count)")
print("Unique items: \(Set(strings).count)")
