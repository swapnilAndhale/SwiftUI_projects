//
//  ContentView.swift
//  SwiftUI componant
//
//  Created by Swapnil on 19/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var slideValue: Double = 2
    @State private var stepperValue: Int = 0
    @State private var toggleOnOff: Bool = true
    @State private var companies = ["Mphasis", "Tech_Mahindra", "HCL", "Infosys", "LTI", "Mindtree", "Reliance", "SBI", "TCS" , "Wipro"]
    var body: some View {
        
        
        ScrollView {
            VStack { // Stack
                
                //Text
                Text("Hello, world!")
                    .padding()
                    .font(.title)
                
                Image(systemName: "plus") // Image
                
                Button("Tap") {
                    //Code
                }
                //Slider
                Slider(value: $slideValue, in: 0...10)
                Text("Current Value of slider = \(slideValue , specifier: "%.2f")")
                
                //Stepes/ Stepper + -
                Stepper("Stepper value :\(stepperValue)" , value: $stepperValue)
                
                
                //Toggle type 1
                Toggle(isOn: $toggleOnOff) {
                    Text("Volume")
                }
                //Toggle type 2
                Toggle("Toggle", isOn: $toggleOnOff)
                    .toggleStyle(.switch)
                //Toggle type 3
                
                Toggle("Toggle", isOn: $toggleOnOff)
                    .toggleStyle(.button)
                    .tint(.gray)
                
                
            }
            .padding()
            
            ScrollView(.horizontal) {
                HStack {
                    
                    ForEach(0..<9) { compay in
                        Image(companies[compay])
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    
                    
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
