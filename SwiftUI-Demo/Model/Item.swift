//
//  Item.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-29.
//

import SwiftUI

// A struct to store exactly one item's data.
struct Item: Identifiable {
    let id = UUID()
    let name: String
}
