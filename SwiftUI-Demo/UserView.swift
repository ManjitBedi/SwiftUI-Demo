//
//  UserView.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-30.
//

import SwiftUI
import OpenAPIURLSession
import OpenAPIRuntime

// Assume we have generated API client code from an OpenAPI spec
// This would typically be in a separate file, generated by the Swift OpenAPI generator
struct GeneratedAPI {
    static let client = Client(serverURL: URL(string: "https://api.example.com")!, transport: URLSessionTransport())

    struct GetUserOperation: APIProtocol {
        static let method: HTTPMethod = .get
        static let path: String = "/users/{userId}"

        struct Input: Encodable {
            let userId: Int
        }

        struct Output: Decodable {
            let id: Int
            let name: String
            let email: String
        }
    }
}

// Our SwiftUI view
struct UserView: View {
    @State private var user: GeneratedAPI.GetUserOperation.Output?
    @State private var isLoading = false
    @State private var errorMessage: String?

    let userId: Int

    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
            } else if let user = user {
                Text("User: \(user.name)")
                Text("Email: \(user.email)")
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            fetchUser()
        }
    }

    private func fetchUser() {
        isLoading = true
        errorMessage = nil

        Task {
            do {
                let input = GeneratedAPI.GetUserOperation.Input(userId: userId)
                let response = try await GeneratedAPI.client.send(GeneratedAPI.GetUserOperation.self, input: input)

                await MainActor.run {
                    self.user = response.body
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
}

// Preview for SwiftUI canvas
struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(userId: 1)
    }
}
