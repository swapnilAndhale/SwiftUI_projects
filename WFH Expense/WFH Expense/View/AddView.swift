//
//  AddView.swift
//  WFH Expense
//
//  Created by Swapnil on 30/07/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Wfhexp
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Rent"
    @State private var amount = 0.0
    
    let types = ["Food", "Wifi", "Travel", "Exam fee", "Rent"]
    
    var body: some View {
        
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "INR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expenses")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
    
}
   
struct AddView_Previews: PreviewProvider {
        static var previews: some View {
            AddView(expenses: Wfhexp())
        }
    }
