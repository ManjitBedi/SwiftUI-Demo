//
//  GradientView.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-29.
//

import SwiftUI

struct GradientView: View {
    let colors: [Color]

    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
