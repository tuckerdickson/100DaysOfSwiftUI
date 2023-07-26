import Cocoa

enum SqrtError: Error {
    case outOfBounds
    case noRoot
}

func intSqrt(of number: Int) throws -> Int {
    // throw error for numbers less than 1 or greater than 10,000
    if number < 1 || number > 10_000 {
        print("inside if")
        throw SqrtError.outOfBounds
    }
    
    // find and return square root (100 is the square root of 10,000)
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    
    // no square root found, throw error
    throw SqrtError.noRoot
}

do {
    try print(intSqrt(of: 0))
    try print(intSqrt(of: 1))
    try print(intSqrt(of: 3))
    
    try print(intSqrt(of: 144))
    try print(intSqrt(of: 212))
    try print(intSqrt(of: 12000))
    
} catch SqrtError.outOfBounds {
    print("Out of bounds")
} catch SqrtError.noRoot {
    print("No root found")
} catch {
    print("An unknown error occurred")
}
