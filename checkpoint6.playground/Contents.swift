import Cocoa

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int
    
    mutating func changeGears(shiftUp: Bool) {
        if shiftUp && currentGear < 10 {
            currentGear += 1
        } else if !shiftUp && currentGear > 1 {
            currentGear -= 1
        } else {
            print("Could not shift \(shiftUp ? "up" : "down")")
        }
    }
}

var car = Car(model: "F-150", numberOfSeats: 4, currentGear: 8)

car.changeGears(shiftUp: true)
print("Current gear: \(car.currentGear)")
car.changeGears(shiftUp: true)
print("Current gear: \(car.currentGear)")
car.changeGears(shiftUp: true)
print("Current gear: \(car.currentGear)")
