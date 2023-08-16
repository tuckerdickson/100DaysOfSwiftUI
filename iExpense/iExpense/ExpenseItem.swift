//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Nathan Dickson on 8/16/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
