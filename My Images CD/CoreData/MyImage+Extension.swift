//
//  MyImage+Extension.swift
//  My Images CD
//
//  Created by Péter Sebestyén on 2024.04.28.
//

import Foundation

extension MyImage {
    var imageName: String {
        name ?? ""
    }
    
    var imageID: String {
        id ?? ""
    }
}
