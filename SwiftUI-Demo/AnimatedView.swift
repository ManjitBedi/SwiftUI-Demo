//
//  AnimatedView.swift
//  SwiftUI-Demo
//
//  Created by Manjit Bedi on 2024-09-12.
//

import SwiftUI

// Note: changed the package iOS target to iOS 17
#if canImport(RealityComposerAssets)

import RealityComposerAssets

struct RealityComposerContent: View {
    var body: some View {
        Text("RealityComposer content")
        // Use RealityComposer specific features here
    }
}

#else

struct RealityComposerContent: View {
    var body: some View {
        Text("Reality Composer animation is not available with this iOS version")
        // Use RealityComposer specific features here
    }
}

#endif

#Preview {
    RealityComposerContent()
}
