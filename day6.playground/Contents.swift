import Cocoa

/*------------------------------------------- 1. How to use a for loop to repeat work -------------------------------------------*/

// For loops can be used to iterate over each element in an array.
let platforms = ["macOS", "iOS", "tvOS", "watchOS"]
for os in platforms {
    print("Swift works great on \(os)")
}

// You can also use for loops to iterate through a range of numbers.
for i in 1...12 {
    print("5 x \(i) is \(5*i)")
}

// For loops can be nested inside of each other...
for i in 1...12 {
    print("The \(i) times table:")
    for j in 1...12 {
        print("\t\(i) x \(j) = \(i*j)")
    }
    print()
}

// You can iterate from one number UP TO a second number (not including the second number).
for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}

// Sometimes we don't even care about the loop variable, so we use an _ instead.
var lyric = "Haters gonna"
for _ in 1...5 {
    lyric += " hate"
}
print(lyric)





/*-------------------------------------- 2. How to use a while loop to repeat work --------------------------------------*/

// Instead of looping a specified number of times, while loops iterate until a condition is satisfied.
var countdown = 10
while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}
print("Blast off!")

// The random function can be used to generate random integers and doubles.
let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

// These random numbers can be used to control a while loop.
var roll = 0
while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)!")
}
print("Critical hit!")





/*---------------------------------- How to skip loop items with break and continue ----------------------------------*/

// Continue can be used inside of a loop to skip the rest of the current iteration, and carry onto the next iteration.
let filenames = ["me.jpg", "work.txt", "sophie.jpg"]
for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    
    print("Found picture: \(filename)")
}

// Break can be used to completely exit the loop, skipping the rest of the current iteration, and all remaining iterations.
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)





/*----------------------------------- Summary: Conditions and loops -----------------------------------*/
// We can use if, else if, and else statements to check conditions.
// You can combine conditions using || and &&.
// Switch statements can be easier than using if and else a lot, and Swift will check that they are exhaustive.
// The ternary conditional operator lets us check WTF: What?, True, False.
// For loops let us loop over arrays, sets, dictionaries, and ranges.
// While loops create loops that continue running until a condition is false.
// We can skip loop items using continue or break respectively.
