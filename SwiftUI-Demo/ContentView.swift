//
//  ContentView.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-29.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSplash = true

    var body: some View {
        ZStack {
            if isShowingSplash {
                SplashView(isShowingSplash: $isShowingSplash)
            } else {
                MainContentView()
            }
        }
    }
}

#Preview {
    ContentView()
}
