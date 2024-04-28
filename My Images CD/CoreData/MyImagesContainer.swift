//
//  MyImagesContainer.swift
//  My Images CD
//
//  Created by Péter Sebestyén on 2024.04.28.
//

import Foundation
import CoreData

class MyImagesContainer {
    let persistenrContainer: NSPersistentContainer
    
    init() {
        persistenrContainer = NSPersistentContainer(name: "MyImagesDataModel")
        persistenrContainer.loadPersistentStores { _, error in
            if let error {
                print(error.localizedDescription)
            }
        }
    }
}
