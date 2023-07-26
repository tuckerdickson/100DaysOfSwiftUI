import Cocoa

/*------------------------------------ 1. How to create and use closures ------------------------------------*/

// In Swift, we can treat functions like variables by assigning them.
func greetUser() {
    print("Hello!")
}
var greetCopy = greetUser
greetCopy()

// You can also assign functionality directly to a variable or constant. This is called a "closure expression".
let sayHello = {
    print("Hello.")
}
sayHello()

// Like functions, closures can have parameters and return types.
let sayHello2 = { (name: String) -> String in
    return "Hi, \(name)!"
}
print(sayHello2("Tucker"))

// We can use type annotations when copying functions.
var greetCopy2: () -> Void = greetUser

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}
let data: (Int) -> String = getUserData
let user = data(1989)
print(user)
// Note: when calling a closure or a copied function, the external parameter labels disappear.

// Recall the sorted function, which sorts a collection of data.
let team = ["Gloria", "Suzy", "Piper", "Sasha", "Tiffany"]
let sortedTeam = team.sorted()
print(sortedTeam)

// We can customize how this function sorts by passing it a closure.
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzy" {
        return true
    } else if name2 == "Suzy" {
        return false
    }
    
    return name1 < name2
}
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

// We can rewrite line 54 by defining the closure directly in the sorted call.
let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzy" {
        return true
    } else if name2 == "Suzy" {
        return false
    }
    
    return name1 < name2
})
print(captainFirstTeam2)





/*----------------------------- 2. How to use trailing closures and shorthand syntax -----------------------------*/

// In the example on line 58, we already know that the by parameter must be a closure that takes in two strings and
// returns a bool. So, we can omit the types and rewrite the closre as...
let captainFirstTeam3 = team.sorted(by: { name1, name2 in
    if name1 == "Suzy" {
        return true
    } else if name2 == "Suzy" {
        return false
    }
    
    return name1 < name2
})
print(captainFirstTeam3)

// In fact, we can simplify this even more using trailing closure syntax.
let captainFirstTeam4 = team.sorted { name1, name2 in
    if name1 == "Suzy" {
        return true
    } else if name2 == "Suzy" {
        return false
    }
    
    return name1 < name2
}
print(captainFirstTeam4)

// If we want, we can replace the parameter names with a special shorthand syntax.
let captainFirstTeam5 = team.sorted {
    if $0 == "Suzy" {
        return true
    } else if $1 == "Suzy" {
        return false
    }
    
    return $0 < $1
}
print(captainFirstTeam5)

// More closure examples.
let sOnly = team.filter { $0.hasPrefix("S") }
print(sOnly)

let upperCaseTeam = team.map { $0.uppercased() }
print(upperCaseTeam)





/*------------------------------- 3. How to accept functions as parameters -------------------------------*/

// Sometimes it's useful to pass functions into functions as parameters.
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

// We can call the above function using a closure...
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print(rolls)

// Or we can call it using a function.
func rollFunc() -> Int {
    Int.random(in: 1...20)
}
let newRolls = makeArray(size: 50, using: rollFunc)
print(newRolls)

// We can pass multiple functions as parameters if we want.
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work...")
    first()
    print("About to start second work...")
    second()
    print("About to start third work...")
    third()
    print("Done.")
}

// To call a function which accepts multiple function parameters, use the following syntax.
doImportantWork {
    print("This is the first work.")
} second: {
    print("This is the second work.")
} third: {
    print("This is the third work.")
}
 




/*----------------------------------------- Summary: Closures -----------------------------------------*/

// You can copy functions in swift.
// You can create closures directly by assigning to a constant or variable.
// Closure parameters and return value are declared inside their braces.
// Functions are able to accept other functions as parameters.
// Anywhere you can pass a function, you can also pass a closure.
// When passing a closure as a function parameter, you don't need to write out the types inside your closure if Swift can figure it out.
// If a function's final parameters are functions, use trailing closure syntax.
// You can also use shorthand parameter names, such as $0 and $1.
// You can make your own functions that accept functions as parameters.
