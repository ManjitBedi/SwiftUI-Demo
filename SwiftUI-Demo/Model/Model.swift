//
//  Model.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-30.
//

import Combine
import SwiftUI

// MARK: - Model
class Model: ObservableObject {
    @Published var favoriteColor: Color = .blue {
        didSet {
            save()
        }
    }

    private let saveKey = "FavoriteColor"

    init() {
        load()
    }

    private func save() {
        if let colorData = try? NSKeyedArchiver.archivedData(withRootObject: UIColor(favoriteColor), requiringSecureCoding: false) {
            UserDefaults.standard.set(colorData, forKey: saveKey)
        }
    }

    private func load() {
        guard let colorData = UserDefaults.standard.data(forKey: saveKey),
              let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData) else {
            return
        }
        favoriteColor = Color(color)
    }
}
