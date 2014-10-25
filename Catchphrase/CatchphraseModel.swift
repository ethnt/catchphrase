//
//  CatchphraseModel.swift
//  Catchphrase
//
//  Created by Ethan Turkeltaub on 10/24/14.
//  Copyright (c) 2014 Ethan Turkeltaub. All rights reserved.
//

import Foundation

class CatchphraseModel {
    var words: [String]
    var usedWords:[String] = []
    
    init() {
        let path = NSBundle.mainBundle().pathForResource("nounlist", ofType: "txt")
        let str = NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)
        let strStr = str as String
        self.words = strStr.componentsSeparatedByString("\n")
    }
    
    func randomWord() -> (word: String, idx: Int) {
        // If there aren't any words left, reset
        if words.isEmpty {
            resetWords()
            
            return randomWord()
        } else {
            let idx = Int(arc4random_uniform(UInt32(words.count)))
            
            return (words[idx], idx)
        }
    }
    
    func nextWord() -> String {
        var candidate = randomWord()
        var candidateWord = candidate.word
        var candidateIdx = candidate.idx
        
        if find(usedWords, candidateWord) != nil {
            return nextWord()
        } else {
            words.removeAtIndex(candidateIdx)
            usedWords.append(candidateWord)
            
            return candidateWord
        }
    }
    
    func resetWords() {
        words = words + usedWords
        
        usedWords = []
    }
}