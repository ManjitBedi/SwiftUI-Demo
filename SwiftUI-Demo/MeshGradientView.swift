//
//  MeshGradientView.swift
//  SwiftUI-Demo
//
//  Created by Manjit Bedi on 2024-09-05.
//

import SwiftUI

struct MeshGradientTestView: View {
    var body: some View {
        if #available(iOS 18.0, *) {
            MeshGradient(width: 3, height: 3, points: [
                .init(0, 0), .init(0.5, 0), .init(1, 0),
                .init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
                .init(0, 1), .init(0.5, 1), .init(1, 1)
            ], colors: [
                .red, .purple, .indigo,
                .orange, .white, .blue,
                .yellow, .green, .mint
            ])
        } else {
            EmptyView()
        }
    }
}

#Preview {
    MeshGradientTestView()
        .ignoresSafeArea()
}
