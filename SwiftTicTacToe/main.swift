//
//  main.swift
//  SwiftTicTacToe
//
//  Created by Baden Hanchett on 6/15/21.
//

import Foundation

print("Hello, World usuing Swift! ")

var inputArray: [String] = []
print("Enter a word:")
while let input = readLine() {
    guard input != "quit" else {
        break
    }
    
    if !inputArray.contains(input) {
        inputArray.append(input)
        print("You entered: \(input)")
    } else {
        print("Negative. \"\(input)\" already exits")
    }
    
    print()
    print("Enter a word:")
}
