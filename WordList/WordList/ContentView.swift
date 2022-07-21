//
//  ContentView.swift
//  WordList
//
//  Created by Swapnil on 21/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var newWord = ""
    @State private var words = [String]()
    @State private var wordsFromFile = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter word", text: $newWord)
                        .autocapitalization(.none)
                    
                }
                
                Section {
                    ForEach(words, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle.fill")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(wordsFromFile)
            .onSubmit(addNewWord)
            .onAppear(perform: addWordsFromFile)
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        withAnimation {
            words.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func addWordsFromFile() {
        
        //1. find URL for allword.rtf app bundle
        if let addWordURL = Bundle.main.url(forResource: "allword", withExtension: "txt") {
            //2. Load file into string
            if let loadfile = try? String(contentsOf: addWordURL) {
                //split string in array of string with line brake "\n"
                let nextlineWord = loadfile.components(separatedBy: "\n")
                
                //pick random word from file else give above word
                wordsFromFile = nextlineWord.randomElement() ?? "above"
                return
            }
        }
        //error
        fatalError("allword.rtf not found or load from bundle ")
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
