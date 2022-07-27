//
//  ContentView.swift
//  WFH Expense
//
//  Created by Swapnil on 27/07/22.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("Hello Second view")
        Button("Dismiss") {
            dismiss()
        }
        
    }
}

struct ContentView: View {
    @State private var showSecondView = false
    var body: some View {
        VStack {
            Button("Show Second view") {
                showSecondView.toggle()
            }
            .sheet(isPresented: $showSecondView) {
                SecondView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
