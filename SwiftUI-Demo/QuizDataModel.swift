//
//  QuizDataModel.swift
//  SwiftUI-Demo
//
//  Created by Manjit Bedi on 2024-09-06.
//

import Foundation

struct QuizQuestion: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
    let correctAnswerIndex: Int
}

class QuizViewModel: ObservableObject {
    @Published var questions: [QuizQuestion]
    @Published var currentQuestionIndex: Int = 0
    @Published var score: Int = 0

    init() {
        self.questions = [
            QuizQuestion(question: "What is the capital of France?",
                         options: ["London", "Berlin", "Paris", "Madrid"],
                         correctAnswerIndex: 2),
            QuizQuestion(question: "Which planet is known as the Red Planet?",
                         options: ["Mars", "Venus", "Jupiter", "Saturn"],
                         correctAnswerIndex: 0),
            // Add more questions here
        ]
    }

    func checkAnswer(_ selectedIndex: Int) {
        if selectedIndex == questions[currentQuestionIndex].correctAnswerIndex {
            score += 1
        }

        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        }
    }
}
