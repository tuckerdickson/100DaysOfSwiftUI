import Cocoa

/*----------------------- 1. How to check if a condition is true or false -----------------------*/

// If statements let us check a condition, and run some code depending on the truth of that condition.
let score = 85

if score > 80 {
    print("Good job!")
}

// Expressions involving comparators evaluate to either true or false, and so they can be used as conditions.
let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going, we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote.")
}

// These comparators can also be used to compare strings.
let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

// The next example involves arrays.
var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

// In addition to < and >, we can also check for equality (using ==) and inequality (using !=).
let country = "Canada"
if country == "Austrailia" {
    print("G'day!")
}

let name = "Taylor Swift"
if name != "Anonymous" {
    print("Welcome, \(name)!")
}

var username = "taylorswift13"
if username.isEmpty {
    username = "Anonymous"
}
print("Welcome, \(username)!")





/*---------------------------- 2. How to check multiple conditions ----------------------------*/

// When we have mutually exclusive conditions, we can use an if-else statement.
let age2 = 16

if age2 >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

// If we want to check multiple conditions at once, we can use logical operators.
let temp = 25

if temp > 20 && temp < 30{
    print("It's a nice day.")
}

let userAge = 14
let hasParentalConsent = true

if age >= 18 || hasParentalConsent {
    print("You can buy the game.")
}

// When we have multiple possible outcomes for multiple different conditions, we can use else if statements.
enum TransportOption {
    case airplane
    case helicopter
    case bicycle
    case car
    case escooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path.")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now.")
}





/*----------------------- 3. How to use switch statements to check multiple conditions -----------------------*/

// When you have a lot of conditions to check, if-else if statements can become very long and redundant.
enum WeatherForecast {
    case sun, wind, rain, snow, unknown
}
var forecast = WeatherForecast.rain

if forecast == .sun {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Bring an umbrella.")
} else if forecast == .wind {
    print("Wear something warm.")
} else if forecast == .snow {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken.")
}

// We can clean this code up a little bit and ensure case coverage using a switch statement.
switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Bring an umbrella.")
case .wind:
    print("Wear something warm.")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken.")
}
// Note: Switch switch statements automatically break and thus don't require a break command.

// The spaces of all possible strings, ints, doubles, etc. are infinite, so we need a default case.
let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman.")
case "Mega-City One":
    print("You're Judge Dredd.")
case "Wakanda":
    print("You're Black Panther")
default:
    print("Who are you?")
}
// Note: the default case will always be run when encountered. This is why we put it at the bottom.

// Fallthrough can be used when you want to continue executing the next case instead of exiting the switch.
let day = 5
print("My true love gave to me...")

switch day {
case 5:
    print("Five golden rings")
    fallthrough
case 4:
    print("Four calling birds")
    fallthrough
case 3:
    print("Three french hens")
    fallthrough
case 1:
    print("Two turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}





/*------------------------- How to use the ternary conditional operator for quick tests -------------------------*/

// The ternary conditional operator is a condensed version of the if statement.
let age3 = 18
let canVote = age3 >= 18 ? "Yes" : "No"
// WTF:        What?        True   False

// The ternary conditional operator can be used inside of a print call.
let hour = 23
print(hour < 12 ? "Before noon" : "Afternoon")

// It can also be used with arrays.
let names = ["Jane", "Kaley", "Mao"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"

enum Theme {
    case light, dark
}
let theme = Theme.dark
let background = theme == .dark ? "Black" : "White"

