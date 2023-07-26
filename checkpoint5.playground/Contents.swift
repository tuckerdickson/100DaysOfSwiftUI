import Cocoa

//  Given the luckyNumbers as input...
//      (1) filter out any numbers that are even,
//      (2) sort the array in ascending order,
//      (3) map them to strings in the format "7 is the lucky number"
//      (4) print the resulting array, one item per line,
//  all without using any intermediate variables.

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let _ = luckyNumbers
    .filter{ !$0.isMultiple(of: 2) }
    .sorted()
    .map{ print("\($0) is the lucky number") }
