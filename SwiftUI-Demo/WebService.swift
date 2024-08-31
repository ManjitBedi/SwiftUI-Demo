//
//  WebService.swift
//  swiftui-test-area
//
//  Created by Manjit Bedi on 2024-08-30.
//

import Foundation
import OpenAPIURLSession

class WebService<C: APIProtocol> {
    let client: C

    init(client: C) {
        self.client = client
    }

    init() where C == Client {
        self.client = Client(
            serverURL: try! Servers.server1(),
            transport: URLSessionTransport()
        )
    }

    func getPost() async -> [Components.Schemas.Post] {
        guard let response = try? await client.getPosts(Operations.getPosts.Input()) else {
            print("Error getting response")
            return []
        }

        switch response {
        case .ok(let okResponse):
            switch okResponse.body {
            case .json(let postResponse):
                return postResponse
            }
        case .undocumented(statusCode: let statusCode, _):
            print("Undocumented Error: \(statusCode)")
            return []
        }
    }
}

struct MockClient: APIProtocol {
    func getPosts(_ input: Operations.getPosts.Input) async throws -> Operations.getPosts.Output {
        let postsBody = [
            Components.Schemas.Post(userId: 1, id: 1, title: "test title 1", body: "test body 1"),
            Components.Schemas.Post(userId: 2, id: 2, title: "test title 2", body: "test body 2")
        ]
        return .ok(Operations.getPosts.Output.Ok(body: .json(postsBody)))
    }
}
