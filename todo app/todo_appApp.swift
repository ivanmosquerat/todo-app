//
//  todo_appApp.swift
//  todo app
//
//  Created by Ivan Mosquera on 27/2/21.
//

import SwiftUI

@main
struct todo_appApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
