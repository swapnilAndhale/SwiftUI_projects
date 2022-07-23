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
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
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
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard realWord(word: answer) else {
            showError(title: "Word already used", message: "Use another word")
            return
        }
        guard possibleWord(word: answer) else {
            showError(title: "Wrong word", message: "Try to put correct word")
            return
        }
        
        guard isReal(word: answer) else {
            showError(title: "word not correct", message: "put right word")
            return
        }
        
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
    
    func realWord(word: String) -> Bool {
        !words.contains(word)    // x  != 10   x = [10, 20 ,30 ,40]   !x.contains(10)
    }
    
    func possibleWord(word: String) -> Bool {
        var tempWord = wordsFromFile
        for letter in word {   // happ y
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location  == NSNotFound
    }
    
    func showError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
