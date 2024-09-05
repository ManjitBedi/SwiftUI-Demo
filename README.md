# SwiftUI Demo
 a place for hacking with Swift & SwiftUI

![](https://github.com/user-attachments/assets/ec5fc2a4-287f-4c4a-aaf7-b4a40fdccb3e)


## Packages - using the Swift package manager

Note: there is an issue with the Xcode 16 beta & resolving packages, I needed to create the project in Xcode 15 as a work around.  The project will work in Xcode 16.
 
 ## UI 
 
 - in a few places, animated sysmbos are being introduced in iOS 17 & new effects have been added with iOS 18
 
 - some custom fonts from [Google fonts](https://fonts.google.com) are being used like [Handjet light](https://fonts.google.com/share?selection.family=Handjet:wght@100..900)
 
 ### Rive
 
* the splash scene is using a demo animation made with [Rive](https://www.rive.app)
    * there are 2 layers in the animations
        * logo - plays once
        * circles moving along a sine wave - loops
            * the sine wave was created as a separate asset & imported into the Rive project
 
 ![](https://github.com/user-attachments/assets/2e4e4a0f-f33b-4aa9-a373-63f271d94d97)

### Open API generator

- [Swift OpenAPI Generator](https://github.com/apple/swift-openapi-generator)
- work in progress
  - the server end point is using some example code made in Vapor; it works in the simulator using local host, you need to build and run the Vapor code on your development platform, e.g. a MacBook
  - to test on an iOS device, I recommend using [ngrok](https://ngrok.com), this will require setting up a developr account

[Link to vapor code on Github](https://github.com/apple/swift-openapi-generator/tree/main/Examples/hello-world-vapor-server-example)


### Reference

[mesh gradient](https://developer.apple.com/documentation/SwiftUI/MeshGradient)

[sf symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/)
