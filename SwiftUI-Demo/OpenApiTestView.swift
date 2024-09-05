//
//  ApiView.swift
//  SwiftUI-Demo
//
//  Created by Manjit Bedi on 2024-08-31.
//

//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftOpenAPIGenerator open source project
//
// Copyright (c) 2023 Apple Inc. and the SwiftOpenAPIGenerator project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftOpenAPIGenerator project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession

#if targetEnvironment(simulator)
    let urlString = "http://127.0.0.1:8080/api"
#else
    // TODO: set to the public IP address or alternate server endpoint
    // I am using ngrok for local testing
    let urlString = "https://60fb-216-232-0-203.ngrok-free.app/api"
#endif

/// A content view that can make HTTP requests to the GreetingService
/// running on localhost to fetch customized greetings.
///
/// By default, it makes live network calls, but it can be provided
/// with `MockClient` to make mocked in-memory calls only, which is more
/// appropriate in previews and tests.
struct OpenApiTestView: View {
    @State private var greeting: String = "Hello, Stranger!"
    @State private var name: String = "Stranger"
    let client: any APIProtocol
    init(client: any APIProtocol) { self.client = client }
    init() {
        if let stringValue = ProcessInfo.processInfo.environment["USE_MOCK_CLIENT"], let boolValue = Bool(stringValue),
            boolValue
        {
            // Allow using the mock client in UI tests.
            self.init(client: MockClient())
        } else {
            // By default, make live network calls.
            self.init(
                client: Client(serverURL: URL(string: urlString)!, transport: URLSessionTransport())
            )
        }
    }
    func updateGreeting() async {
        do {
            let response = try await client.getGreeting(query: .init(name: name))
            greeting = try response.ok.body.json.message
        } catch { greeting = "Error: \(error.localizedDescription)" }
    }
    var body: some View {
        ZStack() {
            GradientView(colors: [.yellow, .white])

            VStack {
                HStack() {
                    Image(systemName: "wifi")
                        .symbolRenderingMode(.palette)
                        .resizable()
                        .frame(width: 50, height: 45)
                        .symbolEffect(.variableColor)
                    Text("Open API")
                        .font(.custom( "Handjet-Light", size: 50))
                        .foregroundColor(.black)
                        .padding()

                    Spacer()
                }.padding()
                Spacer()

                HStack() {
                    Image(systemName: "wifi.router")
                        .imageScale(.large)
                        .symbolEffect(.variableColor)

                    Image(systemName: "ellipsis")
                        .imageScale(.large)
                        .symbolEffect(.variableColor)

                    Image(systemName: "globe")
                        .imageScale(.large)
                        .symbolEffect(.pulse)
                }
                Spacer().frame(height: 10)

                Text(greeting).accessibilityIdentifier("greeting-label")
                Divider()
                TextField("Name", text: $name)
                Button("Refresh greeting") { Task { await updateGreeting() } }

                Divider()
#if targetEnvironment(simulator)
                Text("To test, the server endpoint needs to be available at \n [http://127.0.0.1:8080/api](http://127.0.0.1:8080).")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.indigo)
#else
                Text("To test, the server endpoint needs to be available at \n [\(urlString)](\(urlString)).")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.indigo)
#endif
                Spacer().frame(height: 10)

                Text("You can use the server code here, it is made with Vapor: [link](https://github.com/apple/swift-openapi-generator/tree/main/Examples/hello-world-vapor-server-example)")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.indigo)
                Spacer().frame(height: 10)

                Text("Testing on a device can be done using tools like [Ngrok](https://ngrok.io/).")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.indigo)
            }
            .padding().buttonStyle(.borderedProminent).font(.system(size: 20))
        }
    }
}

// A mock client used in previews and tests to avoid making live network calls.
struct MockClient: APIProtocol {
    func getGreeting(_ input: Operations.getGreeting.Input) async throws -> Operations.getGreeting.Output {
        let name = input.query.name ?? "Stranger"
        return .ok(.init(body: .json(.init(message: "(Mock) Hello, \(name)!"))))
    }
}

#Preview {
    // Use the mock client in previews instead of live network calls.
    OpenApiTestView(client: MockClient())
}
