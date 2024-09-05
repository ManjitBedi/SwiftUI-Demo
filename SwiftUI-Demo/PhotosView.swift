//
//  PhotosView.swift
//  SwiftUI-Demo
//
//  Created by Manjit Bedi on 2024-09-05.
//
// Code taken from an example on the Internet
// https://medium.com/@jpmtech/swiftui-displaying-a-photo-picker-2531c06d5209

import SwiftUI
import PhotosUI

class PhotoSelectorViewModel: ObservableObject {
    @Published var images = [UIImage]()
    @Published var selectedPhotos = [PhotosPickerItem]()

    @MainActor
    func convertDataToImage() {
        // reset the images array before adding more/new photos
        images.removeAll()

        if !selectedPhotos.isEmpty {
            for eachItem in selectedPhotos {
                Task {
                    if let imageData = try? await eachItem.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: imageData) {
                            images.append(image)
                        }
                    }
                }
            }
        }

        // uncheck the images in the system photo picker
        selectedPhotos.removeAll()
    }
}

struct PhotosView: View {
    @StateObject var vm = PhotoSelectorViewModel()
    let maxPhotosToSelect = 5

    @State private var avatarItem: PhotosPickerItem?

    var body: some View {
        ZStack() {
            GradientView(colors: [.pink, .white])

            VStack {
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.fixed(300))]) {
                        ForEach(0..<vm.images.count, id: \.self) { index in
                            Image(uiImage: vm.images[index])
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
                PhotosPicker(
                    selection: $vm.selectedPhotos, // holds the selected photos from the picker
                    maxSelectionCount: maxPhotosToSelect, // sets the max number of photos the user can select
                    selectionBehavior: .ordered, // ensures we get the photos in the same order that the user selected them
                    matching: .images // filter the photos library to only show images
                ) {
                    // this label changes the text of photo to match either the plural or singular case based on the value in maxPhotosToSelect
                    Label("Select up to ^[\(maxPhotosToSelect) photo](inflect: true)", systemImage: "photo")
                }
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
            }
            .padding()
            .onChange(of: vm.selectedPhotos) { _, _ in
                vm.convertDataToImage()
            }
        }
    }
}

#Preview {
    PhotosView()
}
