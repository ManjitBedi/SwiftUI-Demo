//
//  CardView.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-29.
//

import SwiftUI

struct CardView: View {
    let card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(card.color)
                .shadow(radius: 10)

            VStack {
                Text(card.title)
                    .font(.title)
                    .foregroundStyle(.black)

                Text(card.detail)
                    .font(.title)
                    .foregroundStyle(.secondary)

                if let emoji = card.emoji {
                    VStack() {
                        Text(emoji)
                            .font(.largeTitle)
                            .padding(16)
                    }
                    .background(.white)
                    .cornerRadius(16)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .background(.clear)
        .frame(height: 250)
    }
}

#Preview {
    VStack() {
        CardView(card: Card.example).padding()
        CardView(card: Card.example).padding()
    }.background(Color.cyan)
}
