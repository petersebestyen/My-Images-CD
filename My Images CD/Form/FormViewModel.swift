//
//  FormViewModel.swift
//  My Images CD
//
//  Created by Péter Sebestyén on 2024.04.28.
//

import UIKit

class FormViewModel: ObservableObject {
    @Published var name = ""
    @Published var uiImage: UIImage?
    
    var id: String?
    
    var updating: Bool { id != nil }
    
    init(_ uiImage: UIImage) {
        self.uiImage = uiImage
    }
    
    init(_ myImage: MyImage) {
        name = myImage.imageName
        id   = myImage.imageID
        uiImage = UIImage(systemName: "photo")!
    }
    
    var incomplete: Bool {
        name.isEmpty || uiImage == UIImage(systemName: "photo")!
    }
}
