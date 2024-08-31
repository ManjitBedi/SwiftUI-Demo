//
//  StyleModifiers.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-29.
//

import SwiftUI

// Custom Text Styles
struct TextStyle: ViewModifier {
    enum StyleType {
        case title, subtitle, body, footnote
    }

    let type: StyleType

    func body(content: Content) -> some View {
        switch type {
        case .title:
            content
                .font(.system(size: 28, weight: .bold))
        case .subtitle:
            content
                .font(.system(size: 22, weight: .semibold))
        case .body:
            content
                .font(.system(size: 16, weight: .regular))
        case .footnote:
            content
                .font(.system(size: 14, weight: .light))
        }
    }
}

extension View {
    func textStyle(_ style: TextStyle.StyleType) -> some View {
        self.modifier(TextStyle(type: style))
    }
}
