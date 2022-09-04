//
//  Project11_BookwormApp.swift
//  Project11_Bookworm
//
//  Created by admin on 22.08.2022.
//

import SwiftUI

@main
struct Project11_BookwormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
