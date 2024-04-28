//
// Created for My Images CD
// by Stewart Lynch on 2022-10-31
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI
import CoreData
import PhotosUI

struct MyImagesGridView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) private var myImages: FetchedResults<MyImage>
    @StateObject private var imagePicker = ImagePicker()
    
    var body: some View {
        NavigationStack {
            Group {
                if !myImages.isEmpty {
                    // display grid of photos
                } else {
                    Text("Select your first image")
                }
            }
            .navigationTitle("My Images")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    PhotosPicker("New Image",
                                 selection: $imagePicker.imageSelection,
                                 matching: .images,
                                 photoLibrary: .shared())
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

struct MyImagesGridView_Previews: PreviewProvider {
    static var previews: some View {
        MyImagesGridView()
    }
}
