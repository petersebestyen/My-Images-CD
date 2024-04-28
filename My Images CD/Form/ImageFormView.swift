//
//  ImageFormView.swift
//  My Images CD
//
//  Created by Péter Sebestyén on 2024.04.28.
//

import SwiftUI
import PhotosUI

struct ImageFormView: View {
    @ObservedObject var viewModel: FormViewModel
    @StateObject    var imagePicker = ImagePicker()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(uiImage: viewModel.uiImage ?? UIImage(systemName: "photo")!)
                    .resizable()
                    .scaledToFit()
                TextField("Image Name", text: $viewModel.name)
                    .textFieldStyle(.roundedBorder)
                HStack {
                    if viewModel.updating {
                        PhotosPicker("Change Name",
                                     selection: $imagePicker.imageSelection,
                                     matching: .images,
                                     photoLibrary: .shared())
                        .buttonStyle(.bordered)
                    }
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    .disabled(viewModel.incomplete)
                    
                }
                Spacer()
            }
            .padding()
            .navigationTitle(viewModel.updating ? "Upate Image" : "New Image")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                }
                if viewModel.updating {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "trash")
                        }
                        .buttonStyle(.bordered)
                        .tint(.red)
                    }
                }
            }
            .onChange(of: imagePicker.uiImage) { newImage in
                if let newImage {
                    viewModel.uiImage = newImage
                }
            }
        }
    }
}

#Preview {
    ImageFormView(viewModel: FormViewModel(UIImage(systemName: "photo")!))
}
