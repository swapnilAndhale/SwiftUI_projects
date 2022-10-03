//
//  ContentView.swift
//  MissonApp
//
//  Created by Swapnil on 03/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 10
    let astronauts = Bundle.main.decode("astronauts.json")
    var body: some View {
        Text("\(astronauts.count)")
            .padding()
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
