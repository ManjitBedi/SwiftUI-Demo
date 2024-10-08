//
//  SettingsView.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-29.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var model = Model()

    var body: some View {
        ZStack() {
            GradientView(colors: [.green, .yellow])

            VStack {
                HStack() {
                    if #available(iOS 18.0, *) {
                        Image(systemName: "gear")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 48, height: 48)
                            .symbolEffect(.rotate, options: .speed(0.01))
                    } else {
                        Image(systemName: "gear")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 48, height: 48)
                    }

                    Text("Settings")
                        .font(.custom( "Handjet-Light", size: 50))

                    Spacer()
                }.padding()

                Text("Your favorite color is")
                    .font(.headline)

                Rectangle()
                    .fill(model.favoriteColor)
                    .frame(width: 100, height: 100)
                    .border(Color.black, width: 2)

                ColorPicker("Select your favorite color", selection: $model.favoriteColor)
                    .padding()
                Spacer()
            }.padding(.leading)
        }
    }
}

// MARK: - Preview
struct FavoriteColorView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
