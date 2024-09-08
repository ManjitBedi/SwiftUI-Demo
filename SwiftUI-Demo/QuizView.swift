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
        ZStack() {
            GradientView(colors: [.orange, .white])
            VStack {
                Text("Quiz - WIP")
                    .font(.custom( "Handjet-Light", size: 50))
                    .padding()
                
                Text("The quiz is displayed using a project exported from [Rive](https://rive.app/); the text is updated when the view appears with data in the Quiz view model")
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
}

struct QuestionView: View {
    let question: QuizQuestion
    let onAnswerSelected: (Int) -> Void
    @State private var choice = 0
    @State private var correct = ""
    @StateObject private var rvm = RiveEventsVM()

    init(question: QuizQuestion, onAnswerSelected: @escaping (Int) -> Void) {
        self.question = question
        self.onAnswerSelected = onAnswerSelected
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            rvm.view()
                .onAppear(){
                    setQuizContent()
                }
            Text("Event Name: \(rvm.eventName)")
            Text(correct)
        }
        .onChange(of: rvm.eventName) { value, newValue in
            processEventName(newValue)
        }
        .padding()
    }

    private func processEventName(_ name: String) {
         // Process the event name here
        if name == "SubmitEvent" {
            correct = question.correctAnswerIndex == choice ?
            "Correct!" : "Incorrect"

        } else if name == "Choice1Event"{
            choice = 0
        } else if name == "Choice2Event"{
            choice = 1
        } else if name == "Choice3Event"{
            choice = 2
        } else if name == "Choice4Event"{
            choice = 3
        }
     }

    /// Set the text runs in the Rive view model
    /// Note: the names of the runs need to be flagged as exportin the Rive IDE before exporting a project file!
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

class RiveEventsVM: RiveViewModel {
    @Published var eventText = ""
    @Published var eventName = ""

    init() {
        super.init(fileName: "quiz-ui")
    }

    // Subscribe to Rive events and this delegate will be invoked
    @objc func onRiveEventReceived(onRiveEvent riveEvent: RiveEvent) {
        print("Rive event \(riveEvent.name())")
        eventName = riveEvent.name()
        if let openUrlEvent = riveEvent as? RiveOpenUrlEvent {
            if let url = URL(string: openUrlEvent.url()) {
                #if os(iOS)
                UIApplication.shared.open(url)
                #else
                NSWorkspace.shared.open(url)
                #endif
            }
        } else if let generalEvent = riveEvent as? RiveGeneralEvent {
            let genEventProperties = generalEvent.properties();
            if let msg = genEventProperties["message"] {
                eventText = msg as! String
            }
        }

    }
}

#Preview {
    QuizView()
}
