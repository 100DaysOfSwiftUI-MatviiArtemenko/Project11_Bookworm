//
//  DataController.swift
//  Project11_Bookworm
//
//  Created by admin on 22.08.2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error occured: \(error.localizedDescription)")
            }
            
        }
    }
}
