//
//  ImagePicker.swift
//  My Images CD
//
//  Created by Péter Sebestyén on 2024.04.28.
//

import SwiftUI
import PhotosUI

@MainActor
class ImagePicker: ObservableObject {
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            Task {
                try await loadTransferable(from: imageSelection)
            }
        }
    }
    @Published var image: Image?
    @Published var uiImage: UIImage?
    
    func loadTransferable(from item: PhotosPickerItem?) async throws {
        do {
            if let data = try await item?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    self.uiImage = uiImage
                    self.image   = Image(uiImage: uiImage)
                }
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
