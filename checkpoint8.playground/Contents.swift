import Cocoa

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var realEstateAgent: String { get }
    
    func printSalesSummary()
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var realEstateAgent: String
    
    func printSalesSummary() {}
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var realEstateAgent: String
    
    func printSalesSummary() {}
}
