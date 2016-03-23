//
//  Boggle.swift
//  AlgorithmClubSwift
//
//  Created by Andrey Panov on 22/03/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import Foundation

class Booggle {
    
    let col, row: Int
    private var finded = false
    private(set) var board = [[Character]]()
    private var visited = [[Bool]]()
    let word: String
    private let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    init(x: Int, y: Int, word: String) {
        
        self.col = x
        self.row = y
        self.word = word
    }
    
    func buildBoard() {
        
        visited = Array(count: col, repeatedValue: Array(count: row, repeatedValue: false))
        
        for var i = 0; i < col; i++ {
            
            var colomn = [Character]()
            
            for var j = 0; j < row; j++ {
                
                let randomNumber: Int = random() % alphabet.characters.count
                let index = alphabet.startIndex.advancedBy(randomNumber)
                colomn.append(alphabet[index])
            }
            board.append(colomn)
        }
    }
    
    func startSearch() {
        
        for (i, _) in board.enumerate() {
            for (j, _) in board[i].enumerate() {
                if !finded {
                    find(x: i, y: j, tmpWord: "")
                } else {
                    return
                }
            }
        }
        print("Not!")
    }
    
    final func find(x x: Int, y: Int, tmpWord: String) {
        
        if x < 0 || y < 0 || x >= col || y >= row { return }
        
        if finded { return }
        
        if visited[x][y] {
            return
        } else {
            visited[x][y] = true
            print("Visit x \(x) y \(y), tmpWord:\(tmpWord)")
        }
        if tmpWord == word {
            finded = true
            result(true)
            return
        }
        
        let index = word.startIndex.advancedBy(tmpWord.characters.count)
        let character = board[x][y]
        if character != word[index] {
            return
        }
        
        var newWord = tmpWord
        newWord.append(character)
        find(x: x, y: y+1, tmpWord: newWord)
        find(x: x, y: y-1, tmpWord: newWord)
        
        find(x: x+1, y: y, tmpWord: newWord)
        find(x: x-1, y: y, tmpWord: newWord)
        
        find(x: x+1, y: y+1, tmpWord: newWord)
        find(x: x-1, y: y-1, tmpWord: newWord)
        
        find(x: x+1, y: y-1, tmpWord: newWord)
        find(x: x-1, y: y+1, tmpWord: newWord)
    }
    
    func result(isFind: Bool) {
        if isFind {
            print("Find!")
        } else {
            print("Not find")
        }
    }
}
