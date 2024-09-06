//
//  QuizView.swift
//  SwiftUI-Demo
//
//  Created by Manjit Bedi on 2024-09-06.
//

import SwiftUI
import RiveRuntime

struct QuizView: View {
    @StateObject private var viewModel = QuizViewModel()

    var body: some View {
        VStack {
            Text("Quiz")
                .font(.custom( "Handjet-Light", size: 50))
                .padding()

            if viewModel.currentQuestionIndex < viewModel.questions.count {
                QuestionView(question: viewModel.questions[viewModel.currentQuestionIndex],
                             onAnswerSelected: { index in
                                 viewModel.checkAnswer(index)
                             })
            } else {
                Text("Quiz completed! Your score: \(viewModel.score)/\(viewModel.questions.count)")
            }
        }
    }
}

struct QuestionView: View {
    let question: QuizQuestion
    let onAnswerSelected: (Int) -> Void
    let riveViewModel = RiveViewModel(fileName: "quiz-ui")

    var body: some View {

        VStack(alignment: .leading, spacing: 20) {

            riveViewModel.view()
        }
        .padding()
        .onAppear(){

        }
    }
}

#Preview {
    QuizView()
}
