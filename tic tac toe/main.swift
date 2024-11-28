//
//  main.swift
//  tic tac toe
//
//  Created by Arthur Trampnau on 28/11/24.
//

import Foundation


class TicTacToe {
    private var board: [[String]] = [[" ", " ", " "],
                                     [" ", " ", " "],
                                     [" ", " ", " "]]
    private var currentPlayer = "X"


    func printBoard() {
        print("  0   1   2")
        for (rowIndex, row) in board.enumerated() {
            print("\(rowIndex) \(row[0]) | \(row[1]) | \(row[2])")
            if rowIndex < 2 {
                print("  ---+---+---")
            }
        }
    }


    private func checkWin() -> Bool {

        for i in 0..<3 {
            if board[i][0] == currentPlayer && board[i][1] == currentPlayer && board[i][2] == currentPlayer {
                return true
            }
            if board[0][i] == currentPlayer && board[1][i] == currentPlayer && board[2][i] == currentPlayer {
                return true
            }
        }
        if board[0][0] == currentPlayer && board[1][1] == currentPlayer && board[2][2] == currentPlayer {
            return true
        }
        if board[0][2] == currentPlayer && board[1][1] == currentPlayer && board[2][0] == currentPlayer {
            return true
        }
        return false
    }


    private func checkDraw() -> Bool {
        for row in board {
            if row.contains(" ") {
                return false
            }
        }
        return true
    }


    func makeMove(row: Int, col: Int) -> Bool {
        if row < 0 || row > 2 || col < 0 || col > 2 || board[row][col] != " " {
            print("Неверный ход. Попробуйте снова.")
            return false
        }
        board[row][col] = currentPlayer
        return true
    }

 
    private func switchPlayer() {
        currentPlayer = currentPlayer == "X" ? "O" : "X"
    }


    func startGame() {
        print("Добро пожаловать в игру Крестики-Нолики!")
        while true {
            printBoard()
            print("\nХод игрока \(currentPlayer). Введите строку и столбец (через пробел): ", terminator: "")
            if let input = readLine() {
                let parts = input.split(separator: " ").compactMap { Int($0) }
                if parts.count == 2 {
                    let row = parts[0]
                    let col = parts[1]
                    if makeMove(row: row, col: col) {
                        if checkWin() {
                            printBoard()
                            print("\nИгрок \(currentPlayer) победил!")
                            break
                        }
                        if checkDraw() {
                            printBoard()
                            print("\nНичья!")
                            break
                        }
                        switchPlayer()
                    }
                } else {
                    print("Пожалуйста, введите два числа через пробел.")
                }
            }
        }
    }
}

let game = TicTacToe()
game.startGame()

