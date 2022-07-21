//
//  ContentView.swift
//  Image Render
//
//  Created by Swapnil on 21/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var bgColor: Color
    
    var body: some View {
        VStack {
            
            
            Form {
                Section {
                   ColorPicker("Choose a background color", selection: $bgColor)
                        .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
