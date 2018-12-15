//
//  CowsandBullsGame.swift
//  Project2
//
//  Created by Bart Bronselaer on 15/12/2018.
//  Copyright © 2018 Bart Bronselaer. All rights reserved.
//

import Foundation

struct CowsandBullsGame {
    var answer = ""
    var guesses = [String]()
    private var numbers = [Int]()
    var userGuess: String = ""
   
    
    
    
    mutating func submitGuess (inputguess input: String) -> Bool {
        let guessString =  input
        guard Set(guessString).count == 4 else {return false }
        guard guessString.count == 4 else {return false}
        let badCharacters = CharacterSet(charactersIn: "0123456789").inverted
        guard guessString.rangeOfCharacter(from: badCharacters) == nil else {return false}
        guesses.insert(guessString, at: 0)
        return true
    }
    
    
    func result(for guess: String) -> String {
        var bulls = 0
        var cows = 0
        
        let guessLetters = Array(guess)
        let answerLetter = Array(answer)
        
        for (index, letter) in guessLetters.enumerated() {
            if letter == answerLetter[index] {
                bulls += 1
            } else if answerLetter.contains(letter) {
                cows += 1
            }
        }
        return "\(bulls)b \(cows)c"
    }
    
    mutating func startNewGame () {
        answer = ""
        guesses.removeAll(keepingCapacity: true)
        numbers = Array(1...9)
        numbers.shuffle()
        for _ in 0..<4 {
            answer.append(String(numbers.removeLast()))
        }
        print(answer)
    }
}
