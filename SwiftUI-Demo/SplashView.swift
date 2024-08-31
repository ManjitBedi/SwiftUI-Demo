//
//  SplashView.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-29.
//

import SwiftUI
import RiveRuntime

struct SplashView: View {
    @Binding var isShowingSplash: Bool

    var body: some View {
        ZStack {
            GradientView(colors: [.green, .purple])

            // The animation auto plays
            RiveViewModel(fileName: "logo")
                .view()

            VStack {
                Spacer().frame(height: 100)
                Text("The Great Demo app")
                    .textStyle(.title)
                    .foregroundColor(.white)
                    .padding()

                Text("The animation is using [Rive](https://www.rive.app)")
                    .textStyle(.footnote)
                    .foregroundColor(.white)

                Spacer()
                Button {
                    withAnimation {
                        isShowingSplash = false
                    }
                } label: {
                    Image(systemName: "paperplane.circle")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 80, height: 90)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
