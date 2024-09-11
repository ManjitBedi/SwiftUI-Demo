//
//  MeshGradientView.swift
//  SwiftUI-Demo
//
//  Created by Manjit Bedi on 2024-09-05.
//

import SwiftUI

/// Inspired by this article: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-mesh-gradient
///
struct AnimatedMeshView: View {
    var body: some View {
        if #available(iOS 18.0, *) {
            TimelineView(.animation) { timeline in
                let x = (cos(timeline.date.timeIntervalSince1970) + 1) / 2

                MeshGradient(width: 3, height: 3, points: [
                    [0, 0], [0.5, 0], [1, 0],
                    [0, 0.5], [Float(x), 0.5], [1, 0.5],
                    [0, 1], [0.5, 1], [1, 1]
                ], colors: [
                    .purple, .yellow, .pink,
                    .pink, .cyan, .blue,
                    .blue, .purple, .orange,
                ])
            }
        } else {
            EmptyView()
        }
    }
}

struct MeshGradientImageView: View {
    var body: some View {
        if #available(iOS 18.0, *) {
            Image(systemName: "brain.head.profile")
                .font(.system(size: 144, weight: .black))
                .foregroundStyle(
                    MeshGradient(width: 2, height: 2, points: [
                        [0, 0], [1, 0],
                        [0, 1], [1, 1]
                    ], colors: [
                        .indigo, .cyan,
                        .purple, .pink
                    ])
                )
        } else {
            EmptyView()
        }
    }
}

#Preview {
    ZStack() {
        AnimatedMeshView()
        MeshGradientImageView()
    }
        .ignoresSafeArea()
}
