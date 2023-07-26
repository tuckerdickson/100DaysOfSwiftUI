import Cocoa

/*--------------------------------- 1. How to store ordered data in arrays ---------------------------------*/

// Arrays can be used to store multiple values of the same type.
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 16, 5, 10, 7]
var temperatures = [25.8, 26.3, 22.9]

// When reading arrays, we ask for values by the position that they appear in the array (their so-called index).
print(beatles[0])
print(numbers[1])
print(temperatures[2])

// The append function can be used to add an element to an array.
beatles.append("Adrian")

// The types of added data must be consistent with the original data.
// temperatures.append("Chris")        // <- Error!

// An empty array can be initialized using the following syntax.
var nums = Array<Int>()
var albums = Array<String>()

// Equivalently, we can also use this (more intuitive) syntax.
var nums2 = [Int]()
var albums2 = [String]()

// To find the number of elements in an array, use the count property.
print(beatles.count)
print(albums.count)

// Call the remove function to remove one element from an array.
beatles.remove(at: 3)
print(beatles.count)

// Or call the removeAll function to remove all elements from the array.
beatles.removeAll()
print(beatles.count)

// Use the contains function to determine whether an array contains a particular piece of data.
let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

// The sorted function returns a new, sorted array (alphabetically, in the case of strings).
let cities = ["London", "Rome", "Tokyo", "Budapest"]
print(cities.sorted())

// The reversed function returns a ReversedCollectionArray, which can be used to access elements in reverse order.
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()





/*---------------------------- 2. How to store and find data in dictionaries ----------------------------*/

// Dictionaries are good for storing data where order doesn't matter.
let employee = [
    "name": "Taylor Swift",
    "job": "singer",
    "location": "nashville"
]
print(employee["name", default: "Unknown"])

// The type of the keys do not need to match the type of the values in a dictionary.
let hasGraduated = [
    "eric": true,
    "sam": false,
    "bob": true
]

let olympics = [
    2012: "London",
    2016: "Rio",
    2020: "Tokyo"
]

// You can also create empty dictionaries and fill them one-by-one.
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["Lebron James"] = 206

// Like with arrays, count and removeAll can be used with dictionaries.
print(heights.count)
heights.removeAll()
print(heights.count)





/*---------------------------- 3. How to use sets for fast data lookup ----------------------------*/

// Sets are like arrays but they aren't ordered and don't allow duplicates.
let actors = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(actors)

// Use the insert function to add an element to a set.
var actresses = Set<String>()
actresses.insert("Jennifer Aniston")

// Sets are optimized for locating elements. So, the contains function will only take a split second to run.
actors.contains("Liam Neeson")





/*---------------------------- 4. How to create and use enums ----------------------------*/

// Enums (short for enumerations) can be used to create custom named values.
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
 
var day = Weekday.monday
day = .tuesday
day = .friday
