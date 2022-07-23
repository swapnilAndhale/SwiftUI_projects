//
//  ContentView.swift
//  Animation
//
//  Created by Swapnil on 23/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap me") {
            animationAmount = animationAmount + 1
            //or
            //animationAmount += 1
        }
        .padding(30)
        .font(.title)
        .background(.yellow)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount) // 1
        //.blur(radius: (animationAmount - 1) * 3)
        //.animation(.easeOut, value: animationAmount)
        //.animation(.interpolatingSpring(stiffness: 0.5, damping: 1), value: animationAmount)
        .overlay(
        
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(),value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
