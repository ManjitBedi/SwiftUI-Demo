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
    var body: some View {
        ZStack() {
            if #available(iOS 18.0, *) {
                AnimatedMeshView()
                MeshGradientImageView()
            } else {
                GradientView(colors: [.yellow, .orange])
            }

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
