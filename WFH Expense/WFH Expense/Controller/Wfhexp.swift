//
//  Wfhexp.swift
//  WFH Expense
//
//  Created by Swapnil on 30/07/22.
//

import Foundation

class Wfhexp: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let saveItems = UserDefaults.standard.data(forKey: "Items") {
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: saveItems) {
                items = decoded
                return
            }
             
        }
        items = []
    }
    
}
