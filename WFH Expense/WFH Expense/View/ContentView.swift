//
//  ContentView.swift
//  WFH Expense
//
//  Created by Swapnil on 27/07/22.
//

import SwiftUI


struct ContentView: View {
    @StateObject var expenses = Wfhexp()
    @State private var showAddView = false
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "INR"))
                    }
                    
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("WFHExpense")
            .toolbar {
                Button {
                    showAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddView) {
                AddView(expenses: expenses)
            }
        }
        
        
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
