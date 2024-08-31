//
//  HomeView.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-29.
//

import SwiftUI

struct HomeView: View {
    let items = [
        Card(title: "Apple", detail: "A red fruit.", color: .red, emoji: "🍎"),
        Card(title: "Oranges", detail: "Orange juice is kind of yellow.", color: .orange, emoji: "🍊"),
        Card(title: "Bananas", detail: "They go good in smoothies.", color: .yellow, emoji: "🍌")
    ]

    var body: some View {
        ZStack() {
            GradientView(colors: [.green, .purple])

            VStack() {
                Text("Home")
                List(items) { item in
                    CardView(card: item)
                }.scrollContentBackground(.hidden)
            }
        }
    }
}

// A view that shows the data for one Restaurant.
struct ItemRow: View {
    var item: Item

    var body: some View {
        Text("\(item.name)")
    }
}

#Preview {
    HomeView()
}
