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
            GradientView(colors: [.pink, .white])

            VStack() {
                HStack() {
                    Image(systemName: "person.crop.circle")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                    Text("Profile")
                        .font(.custom( "Handjet-Light", size: 50))
                        .foregroundColor(.white)
                        .padding()

                    Spacer()
                }.padding()
                Spacer()

            }
        }
    }
}

#Preview {
    ProfileView()
}
