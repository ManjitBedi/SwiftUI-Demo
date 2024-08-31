//
//  ApiContentView.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-30.
//

//  ContentView.swift
import OpenAPIRuntime
import SwiftUI

struct ApiContentView: View {
    @State var postData = [Components.Schemas.Post]()

    var body: some View {
        VStack {
            List(postData, id: \.id) { post in
                HStack {
                    Text("\(post.userId)")
                        .padding()
                        .overlay(Circle().stroke(.blue))

                    VStack(alignment: .leading) {
                        Text(post.title)
                            .bold()
                            .lineLimit(1)

                        Text(post.body)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                    }
                }
            }
        }
        .task {
            // get mock data
            postData = await WebService(client: MockClient()).getPost()

            // get prod data
//            postData = await WebService().getPost()
        }
    }
}

#Preview {
    ContentView()
}
