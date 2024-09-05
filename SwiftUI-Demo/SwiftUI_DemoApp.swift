//
//  SwiftUI_DemoApp.swift
//  SwiftUI-Demo
//
//  Created by Manjit Bedi on 2024-08-31.
//

import SwiftUI

@main
struct SwiftUI_DemoApp: App {
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
#if targetEnvironment(simulator)
        .onChange(of: scenePhase) { phase, oldPhase in
            if phase == .active {
                ListInstalledFonts()
            }
        }
#endif
    }

    /// List all the fonts - used to check the names of custom fonts.
#if targetEnvironment(simulator)
    func ListInstalledFonts() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
#endif
}
