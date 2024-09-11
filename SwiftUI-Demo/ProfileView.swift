//
//  ProfileView.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-29.
//
// What is the purpose of this view, I am not sure (yet)

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var vm = PhotoSelectorViewModel()
    let maxPhotosToSelect = 1

    @State private var avatarItem: PhotosPickerItem?

    var body: some View {
        ZStack() {
            AnimatedMeshView()
            MeshGradientImageView()

            VStack() {
                Spacer().frame(height: 30)
                HStack() {
                    Image(systemName: "person.crop.circle")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 48, height: 48)

                    Text("Profile")
                        .font(.custom( "Handjet-Light", size: 50))
                        .foregroundColor(.white)
                        .padding()

                    Spacer()
                }.padding()

                Spacer()
            }.padding(.leading)
        }.ignoresSafeArea()
    }
}

#Preview {
    ProfileView()
}
