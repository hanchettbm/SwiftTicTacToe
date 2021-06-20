//
//  main.swift
//  SwiftTicTacToe
//
//  Created by Baden Hanchett on 6/15/21.
//

// Imports Swift Foundations for Command line.
import Foundation

// Print Function that Prints the Tic Tac Toe board along with a key.
func print_board(board: [Int: String]) {
    print()
    print("    Key:           You:   ")
    print()
//  Prints each dictonary value in its spot on the board.
    print(" 1 | 2 | 3      \(String(describing: board[1]!)) | \(String(describing: board[2]!)) | \(String(describing: board[3]!))" )
    print("---|---|---    ---|---|---")
    print(" 4 | 5 | 6      \(String(describing: board[4]!)) | \(String(describing: board[5]!)) | \(String(describing: board[6]!))" )
    print("---|---|---    ---|---|---")
    print(" 7 | 8 | 9      \(String(describing: board[7]!)) | \(String(describing: board[8]!)) | \(String(describing: board[9]!))" )
    print()
}

// Checks if space is empty and if the user put in a value that is in the key.
func validateMove(input: Int, board: [Int: String]) -> Bool {
//  Checks for empty space and non default value.
    if board[input] == " " && input != 0 {
        return true
    }
    return false
}

// uses different win combinations from an array to check the board values for a win.
func checkWin(board: [Int: String], player: String) -> Bool {
//  List of every possibly win combination.
    let winCombinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                           [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    var i = 0
    var markCount: Int = 0
    while i < 8 {
//          Loop through each combination.
            markCount = 0
            var j = 0
            while j < 3 {
                let check: String = board[winCombinations[i][j]]!
//              Check if there is an x or o in the combination spot.
                if (check == player) {
//                  Add a point if there is a value in the correct spot.
                    markCount = markCount + 1
                }
//              If there's enough points, it's a win!
                if markCount == 3 {
                    return true;
                }
                j = j + 1
            }
        i = i + 1
        }
// If we checked all combos without 3 in a row, there's no winner yet.
   return false;
}

// Check to see if there's a tie.
func checkTie(board: [Int: String])-> Bool {
    for spot in board.values {
//      If the board still has empty spots a tie is not possible yet.
        if spot == " "{
            return false
        }
    }
//  If all the spots are full (And the win function is false) the it's a tie.
    return true
}

// Function to initalize the game, and give instruction.
func firstrun() -> (Bool, Dictionary<Int, String>) {
//  Set up our board.
    var board: [Int: String] = [1: " ", 2: " ",3: " ", 4: " ", 5: " ", 6: " ", 7: " ", 8: " ", 9: " ",]
    print ("Welcome to a normal Game of Tic Tac Toe.")
    print ("Player 1 is 'X' and Player 2 is 'O'")
    print ("Who goes first will be randomly chosen.")
    print()

//  Use a boolean generator to pick who goes first (for fairness).
    var player1or2 = Bool.random()
    if player1or2 == true{
        print ("Player 1 (X) was randomly selected to go first")
        print()
//      Output a key.
        print (" 1 | 2 | 3 ")
        print ("---|---|---")
        print (" 4 | 5 | 6 ")
        print ("---|---|---")
        print (" 7 | 8 | 9 ")
        print()
        print ("Player 1 pick a location")
//      Get user input and save as an Int.
        let userinput : String = readLine() ?? "None"
        let input = Int(userinput)
        let player1 = "X"
//      Validate the move before the board is updated.
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
//          Resets so the player can put in a vaild number.
            print_board(board: board)
            player1or2 = true
        }
    }

    if player1or2 == false{
        print ("Player 2 (O) was randomly selected to go first")
        print()
//      Output a key.
        print (" 1 | 2 | 3 ")
        print ("---|---|---")
        print (" 4 | 5 | 6 ")
        print ("---|---|---")
        print (" 7 | 8 | 9 ")
        print()
        print ("Player 2 pick a location:")
//      Get user input and save as an Int.
        let userinput : String = readLine() ?? "None"
        let input = Int(userinput)
        let player2 = "O"
//      Validate the move before the board is updated.
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
//          Resets so the player can put in a vaild number.
            print_board(board: board)
            player1or2 = false
        }
    }
    
    return(player1or2,board)
}

// Starts the game loop.
func game(){
    
    let start = firstrun()
    var player1or2 = start.0
    var board = start.1
    var GameOver = false;
    
    while GameOver == false {
    
        if player1or2 == false{
            print()
            print ("Player 1 turn: Pick a location")
//      Get user input and save as an Int.
            let userinput : String = readLine() ?? "None"
            let input = Int(userinput)
            let player1 = "X"
//      Validate the move before the board is updated.
            let validate = validateMove(input: input ?? 0, board: board)
            if validate == true {
                board.updateValue(player1, forKey: input ?? 0)
                print_board(board: board)
                let win = checkWin(board: board, player: player1)
//              Checks for a Tie (After Check for win).
                let isTie = checkTie(board: board)
                if win == true{
                    print("Congrats! Player 1 has Won!")
                    print()
//                  Stops loop for winner.
                    GameOver = true
                }
                else if isTie == true {
                    print()
                    print("Looks Like you Tied! Better think ahead for the next one!")
                    print()
//                  Stops loop for tie.
                    GameOver = true
                }
                else {
//                  If no win or tie or invalid triggered, switch players.
                    player1or2 = true
                }
            }
            else {
                print()
                print("Sorry! That Move is not valid, Try Again!")
                print()
    //          Resets so the player can put in a vaild number.
                print_board(board: board)
                player1or2 = false
            }
        }
    
    
        if player1or2 == true{
            print()
            print ("Player 2 turn: Pick a location")
//      Get user input and save as an Int.
            let userinput : String = readLine() ?? "None"
            let input = Int(userinput)
            let player2 = "O"
//      Validate the move before the board is updated.
            let validate = validateMove(input: input ?? 0, board: board)
            if validate == true {
                board.updateValue(player2, forKey: input ?? 0)
                print_board(board: board)
                let win = checkWin(board: board, player: player2)
//              Checks for a Tie (After Check for win).
                let isTie = checkTie(board: board)
                if win == true{
                    print("Congrats! Player 2 has Won!")
                    print()
//                  Stops loop for winner.
                    GameOver = true
                }
                else if isTie == true {
                    print()
                    print("Looks Like you Tied! Better think ahead for the next one!")
                    print()
//                  Stops loop for tie.
                    GameOver = true
                }
                else {
//                  If no win or tie or invalid triggered, switch players.
                    player1or2 = false
                }
            }
            else {
                print()
                print("Sorry! That Move is not valid, Try Again!")
                print()
    //          Resets so the player can put in a vaild number.
                print_board(board: board)
                player1or2 = true
            }
        }
    }
}

// Run the main function of the game.
game()
