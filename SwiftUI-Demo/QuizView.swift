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
    @StateObject private var rvm: RiveViewModel

    init(question: QuizQuestion, onAnswerSelected: @escaping (Int) -> Void) {
        self.question = question
        self.onAnswerSelected = onAnswerSelected
        _rvm = StateObject(wrappedValue: RiveViewModel(fileName: "quiz-ui", artboardName: "QuizArtboard"))
    }

    var body: some View {

        VStack(alignment: .leading, spacing: 20) {

            rvm.view()
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        setQuizContent()
                    }
                }
            Button("Start") {
                setQuizContent()
            }
        }
        .padding()

    }

    /// Set the text runs in the Rive view model
    /// Note: the names of the runs need to be exported!
    func setQuizContent() {

        do {
            try rvm.setTextRunValue("QuestionRun", textValue: question.question)
        } catch {
            print(error)
        }

        for (index, option) in question.options.enumerated() {
            let run = "Choice\(index+1)Run"
            do {
                try rvm.setTextRunValue(run, textValue: option)
            } catch {
                print(error)
            }
        }
    }
}


#Preview {
    QuizView()
}
