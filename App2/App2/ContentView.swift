//
//  ContentView.swift
//  App2
//
//  Created by Swapnil on 14/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var companies = ["Mphasis", "Tech_Mahindra", "HCL", "Infosys", "LTI", "Mindtree", "Reliance", "SBI", "TCS" , "Wipro"]
    
    @State private var selectCompany = Int.random(in: 0...2)
    
    @State private var showScore = false
    @State private var scoreTitle = ""

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .mint]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                VStack {
                    Text("Tap for companies")
                        .font(.title)
                        .foregroundColor(.white)
                    Text(companies[selectCompany])
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                       
                    
                }
                
                
                ForEach(0..<3) { company in
                    
                    Button {
                        comapnyTap(company)
                    } label: {
                        Image(companies[company])
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 300, height: 120)
                        
                        
                    }
                }
                
            }
        }
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Next", action: askCompany)
        } message: {
            Text("Your Score.. ")
        }
        
    }
    func comapnyTap(_ company: Int) {
        if company == selectCompany {
            scoreTitle = "Correct"

        } else {
            scoreTitle = "Wrong"
          
        }
        
        showScore = true
    }
    
    func askCompany() {
        companies.shuffle()
        selectCompany = Int.random(in: 0...2)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
