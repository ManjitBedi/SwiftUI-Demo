//
//  Card.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-29.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    var title: String
    var detail: String
    var color: Color
    var emoji: String?

    static let example = Card(title: "Apple", detail: "A red fruit.", color: .red)
}
