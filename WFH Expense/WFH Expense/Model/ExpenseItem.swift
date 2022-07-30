//
//  ExpenseItem.swift
//  WFH Expense
//
//  Created by Swapnil on 29/07/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable{
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
