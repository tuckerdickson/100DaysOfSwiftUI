//
//  ContentView.swift
//  Challenge2
//
//  Created by Tucker Dickson on 7/31/23.
//

import SwiftUI

struct ContentView: View {
    @State private var move = 0
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var showScore = false
    @State private var message = ""
    @State private var questionNumber = 1
    
    private let moves = ["Rock", "Paper", "Scissors"]
    private let winningMoves = ["Paper", "Scissors", "Rock"]
    private let losingMoves = ["Scissors", "Rock", "Paper"]
    private let numberOfQuestions = 10
    
    var body: some View {
        VStack(spacing: 40) {
            HStack(spacing: 20) {
                Text(moves[move])
                Text(shouldWin ? "Win" : "Lose")
            }
            .font(.title)
            
            HStack(spacing: 40) {
                Button("🪨") {
                    takeGuess(guess: 0)
                }
                Button("📃") {
                    takeGuess(guess: 1)
                }
                Button("✂️") {
                    takeGuess(guess: 2)
                }
            }
            .font(.largeTitle)
            
            Text("Score: \(score)")
        }
        .padding()
        .alert(message, isPresented: $showScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Score: \(score)")
        }
    }
    
    private func takeGuess(guess: Int) {
        if questionNumber < numberOfQuestions {
            if (shouldWin && (moves[guess] == winningMoves[move])) ||
                (!shouldWin && (moves[guess] == losingMoves[move])) {
                score += 1
                message = "Correct!"
            } else {
                score -= 1
                message = "Incorrect!"
            }
            
            questionNumber += 1
        } else {
            message = "Game Over!"
            score = 0
            questionNumber = 1
        }
        showScore = true
    }
    
    private func askQuestion() {
        move = Int.random(in: 0..<moves.count)
        shouldWin.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
