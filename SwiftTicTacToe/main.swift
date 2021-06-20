//
//  main.swift
//  SwiftTicTacToe
//
//  Created by Baden Hanchett on 6/15/21.
//

import Foundation

func print_board(board: [Int: String]) {
    print()
    print("    Key:           You:   ")
    print()
    print(" 1 | 2 | 3      \(String(describing: board[1]!)) | \(String(describing: board[2]!)) | \(String(describing: board[3]!))" )
    print("---|---|---    ---|---|---")
    print(" 4 | 5 | 6      \(String(describing: board[4]!)) | \(String(describing: board[5]!)) | \(String(describing: board[6]!))" )
    print("---|---|---    ---|---|---")
    print(" 7 | 8 | 9      \(String(describing: board[7]!)) | \(String(describing: board[8]!)) | \(String(describing: board[9]!))" )
    print()
}

func validateMove(input: Int, board: [Int: String]) -> Bool {
    if board[input] == " " && input != 0 {
        return true
    }
    return false
}

func checkWin(board: [Int: String], player: String) -> Bool {
    let winCombinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                           [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    var i = 0
    var markCount: Int = 0
    while i < 8 {
            markCount = 0
            var j = 0
            while j < 3 {
                let check: String = board[winCombinations[i][j]]!
                if (check == player) {
                    markCount = markCount + 1
                }
                if markCount == 3 {
                    return true;
                }
                j = j + 1
            }
        i = i + 1
        }
   return false;
}

func checkTie(board: [Int: String])-> Bool {
    for spot in board.values {
        if spot == " "{
            return false
        }
    }
    
    return true
}

func firstrun() -> (Bool, Dictionary<Int, String>) {
    var board: [Int: String] = [1: " ", 2: " ",3: " ", 4: " ", 5: " ", 6: " ", 7: " ", 8: " ", 9: " ",]
    print ("Welcome to a normal Game of Tic Tac Toe.")
    print ("Player 1 is 'X' and Player 2 is 'O'")
    print ("Who goes first will be randomly chosen.")
    print()

    var player1or2 = Bool.random()
    if player1or2 == true{
        print ("Player 1 (X) was randomly selected to go first")
        print()
        print (" 1 | 2 | 3 ")
        print ("---|---|---")
        print (" 4 | 5 | 6 ")
        print ("---|---|---")
        print (" 7 | 8 | 9 ")
        print()
        print ("Player 1 pick a location")
        let userinput : String = readLine() ?? "None"
        let input = Int(userinput)
        let player1 = "X"
        let validate = validateMove(input: input ?? 0, board: board)
        if validate == true {
            board.updateValue(player1, forKey: input ?? 0)
            let win = checkWin(board: board, player: player1)
            if win == true{
                print("Congrats! Player 1 has Won!")
            }
            print_board(board: board)
        }
        else {
            print()
            print("Sorry! That Move is not valid, Try Again!")
            print()
            print_board(board: board)
            player1or2 = true
        }
    }

    if player1or2 == false{
        print ("Player 2 (O) was randomly selected to go first")
        print()
        print (" 1 | 2 | 3 ")
        print ("---|---|---")
        print (" 4 | 5 | 6 ")
        print ("---|---|---")
        print (" 7 | 8 | 9 ")
        print()
        print ("Player 2 pick a location:")
        let userinput : String = readLine() ?? "None"
        let input = Int(userinput)
        let player2 = "O"
        let validate = validateMove(input: input ?? 0, board: board)
        if validate == true {
            board.updateValue(player2, forKey: input ?? 0)
            let win = checkWin(board: board, player: player2)
            if win == true{
                print("Congrats! Player 2 has Won!")
            }
            print_board(board: board)
        }
        else {
            print()
            print("Sorry! That Move is not valid, Try Again!")
            print()
            print_board(board: board)
            player1or2 = false
        }
    }
    
    return(player1or2,board)
}

func game(){
    
    let start = firstrun()
    var player1or2 = start.0
    var board = start.1
    var GameOver = false;
    
    while GameOver == false {
    
        if player1or2 == false{
            print()
            print ("Player 1 turn: Pick a location")
            let userinput : String = readLine() ?? "None"
            let input = Int(userinput)
            let player1 = "X"
            let validate = validateMove(input: input ?? 0, board: board)
            if validate == true {
                board.updateValue(player1, forKey: input ?? 0)
                print_board(board: board)
                let win = checkWin(board: board, player: player1)
                let isTie = checkTie(board: board)
                if win == true{
                    print("Congrats! Player 1 has Won!")
                    print()
                    GameOver = true
                }
                else if isTie == true {
                    print()
                    print("Looks Like you Tied! Better think ahead for the next one!")
                    print()
                    GameOver = true
                }
                else {
                    player1or2 = true
                }
            }
            else {
                print()
                print("Sorry! That Move is not valid, Try Again!")
                print()
                print_board(board: board)
                player1or2 = false
            }
        }
    
    
        if player1or2 == true{
            print()
            print ("Player 2 turn: Pick a location")
            let userinput : String = readLine() ?? "None"
            let input = Int(userinput)
            let player2 = "O"
            let validate = validateMove(input: input ?? 0, board: board)
            if validate == true {
                board.updateValue(player2, forKey: input ?? 0)
                print_board(board: board)
                let win = checkWin(board: board, player: player2)
                let isTie = checkTie(board: board)
                if win == true{
                    print("Congrats! Player 2 has Won!")
                    print()
                    GameOver = true
                }
                else if isTie == true {
                    print()
                    print("Looks Like you Tied! Better think ahead for the next one!")
                    print()
                    GameOver = true
                }
                else {
                    player1or2 = false
                }
            }
            else {
                print()
                print("Sorry! That Move is not valid, Try Again!")
                print()
                print_board(board: board)
                player1or2 = true
            }
        }
    }
}

game()
