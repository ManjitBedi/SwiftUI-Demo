# SwiftUI Demo
 a place for hacking with Swift & SwiftUI

![](https://github.com/user-attachments/assets/ec5fc2a4-287f-4c4a-aaf7-b4a40fdccb3e)


## Packages - using the Swift package manager

Note: there is an issue with the Xcode 16 beta & resolving packages, I needed to create the project in Xcode 15 as a work around.  The project will work in Xcode 16.
 
 ### Rive
 
- the splash scene is using a demo animation made with [Rive](https://www.rive.app)
- there are 2 layers in the animations
 - logo - plays once
 - circles moving along a sine wave - loops

### Open API generator

- [Swift OpenAPI Generator](https://github.com/apple/swift-openapi-generator)
- work in progress
  - the server end point is using some example code made in Vapor; it works in the simulator using local host, you need to build and run the Vapor code on your development platform, e.g. a MacBook
  - to test on an iOS device, I recommend using [ngrok](https://ngrok.com), this will require setting up a developr account

[Link to vapor code on Github](https://github.com/apple/swift-openapi-generator/tree/main/Examples/hello-world-vapor-server-example)
