//
//  ContentView.swift
//  VideoPlayer
//
//  Created by Swapnil on 03/10/22.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        //Local
//        VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "Accenture", withExtension: "mp4")!))
//            .frame(height: 400)
        
        // URL / remote
        VideoPlayer(player: AVPlayer(url: URL(string: "https://bit.ly/swswift")!))
            .frame(height: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
