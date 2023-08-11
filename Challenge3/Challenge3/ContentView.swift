//
//  ContentView.swift
//  Challenge3
//
//  Created by Tucker Dickson on 8/10/23.
//

import SwiftUI

struct Question {
    let text: String
    let answer: Int
    
    init(num1: Int, num2: Int) {
        text = "\(num1) x \(num2) = "
        answer = num1 * num2
    }
}

struct ContentView: View {
    @State private var gameIsActive = false
    @State private var score = 0
    
    @State private var showingAlert = false
    @State private var alertTitle = "Game Over"
    @State private var alertMessage = ""
    
    @State private var multTable = 6
    @State private var numberOfQuestions = 5
    
    @State private var questions = [Question]()
    @State private var answer = ""
    @State private var questionNumber = 0
    
    private let minMultTable = 2
    private let maxMultTable = 12
    
    private let minNumberOfQuestion = 5
    private let maxNumberOfQuestions = 20
    private let step  = 5
    
    var body: some View {
        NavigationView {
            Form {
                
                if gameIsActive {
                    Section {
                        HStack{
                            Text(questions[questionNumber].text)
                            TextField("???", text: $answer)
                                .keyboardType(.numberPad)
                                .onSubmit {
                                    checkAnswer()
                                    if questionNumber >= numberOfQuestions {
                                        showAlert()
                                    }
                                }
                        }
                        .font(.largeTitle)
                    }
                    
                    Section {
                        Text("Score: \(score)")
                        
                        Button("End game") {
                            endGame()
                        }
                    }
                } else {
                    
                    Section("Multiplication table") {
                        Stepper("Up to \(multTable)", value: $multTable, in: minMultTable...maxMultTable)
                    }
                    
                    Section("Number of questions") {
                        Stepper("\(numberOfQuestions) questions", value: $numberOfQuestions, in: minNumberOfQuestion...maxNumberOfQuestions, step: step)
                    }
                    
                    Button("Go!") {
                        newGame()
                    }
                }
            }
            .navigationTitle("EduMult")
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("Continue") {
                    showingAlert = false
                    endGame()
                }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private func createQuestionArray() {
        questions.removeAll()
        questionNumber = 0
        
        for i in minMultTable...multTable {
            for j in minMultTable...12 {
                let newQuestion = Question(num1: i, num2: j)
                questions.append(newQuestion)
            }
        }
        questions.shuffle()
    }
    
    private func checkAnswer() {
        if Int(answer) == questions[questionNumber].answer {
            score += 1
        }
        questionNumber += 1
        answer = ""
    }
    
    private func endGame() {
        gameIsActive = false
    }
    
    private func newGame() {
        createQuestionArray()
        score = 0
        gameIsActive = true
    }
    
    private func showAlert() {
        alertMessage = "You got \(score) out of \(numberOfQuestions) questions correct!"
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
