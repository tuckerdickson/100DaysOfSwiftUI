import Cocoa

/*------------------------------ 1. How to use type annotations ------------------------------*/

// Swift's type inference can be overridden by manually expressing the type of a variable.
let surname: String = "Lasso"
var score: Double = 0

// Recall the types of data that we've seen so far...
let playerName: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true

// We've also seen the following complex data types...
var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

// To create an empty array, we use...
var sodas: [String] = [String]()
var cities: [String] = []

// However, because of Swift's type inference, we don't need the [String] on the left.
var clues = [String]()

// In the case of enums, we can remove the type after declaring a variable.
enum UIStyle {
    case light
    case dark
    case system
}

var style = UIStyle.light
style = .dark
style = .system

// If you want, you can even create variables and give them a type, but not assign any value.
let username: String
username = "@twostraws"





/*------------------------------ 2. Summary: Complex data ------------------------------*/

// Arrays store many values and read them using indices.
// Dictionaries store many values and read them using keys we specify.
// Sets store many values but we don't choose their order.
// Enums create our own types to specify a range of acceptable values.
// Swift uses type inference to figure what data we're storing.
// It's also possible to use type annotation to force a particular type.
