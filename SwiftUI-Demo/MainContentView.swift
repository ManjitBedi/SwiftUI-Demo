//
//  MainContentView.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-29.
//

import SwiftUI

struct MainContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }

            QuizView()
                .tabItem {
                    Image(systemName: "questionmark")
                    Text("Quiz")
                }

            OpenApiTestView()
                .tabItem {
                    Image(systemName: "network")
                    Text("Open API")
                }

            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    MainContentView()
}
