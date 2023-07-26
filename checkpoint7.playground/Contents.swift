import Cocoa

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("I am a dog.")
    }
}

class Cat: Animal {
    let isTame: Bool

    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("I am a cat.")
    }
}

class Corgi: Dog {
    override func speak() {
        print("I am a corgi.")
    }
}

class Poodle: Dog {
    override func speak() {
        print("I am a poodle.")
    }
}

class Persian: Cat {
    override func speak() {
        print("I am a persian.")
    }
}

class Lion: Cat {
    override func speak() {
        print("I am a lion.")
    }
}

let dog = Dog(legs: 4)
let corgi = Corgi(legs: 4)
let poodle = Poodle(legs: 4)

let cat = Cat(legs: 4, isTame: true)
let persian = Persian(legs: 4, isTame: true)
let lion = Lion(legs: 4, isTame: false)

dog.speak()
corgi.speak()
poodle.speak()

cat.speak()
persian.speak()
lion.speak()
