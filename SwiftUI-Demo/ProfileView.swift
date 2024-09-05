//
//  ProfileView.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-29.
//

import SwiftUI

struct ProfileView: View {
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
