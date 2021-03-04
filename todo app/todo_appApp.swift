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
            RoutinesListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                //.environmentObject(IconName())
                //.environmentObject(Routine())
        }
    }
}

// MARK: - Alternate icons
class IconName: ObservableObject{
    var iconNames: [String?] = [nil]
    @Published var currentIndex = 0
    
    init() {
        getAlternateIconsNames()
        
        if let currentIcon = UIApplication.shared.alternateIconName{
            currentIndex = iconNames.firstIndex(of: currentIcon) ?? 0
        }
    }
    
    func getAlternateIconsNames(){
        if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String : Any],
           let alternateIcons = icons["CFBundleAlternateIcons"] as? [String : Any] {
            
            for (_, value) in alternateIcons{
                guard let iconList = value as? Dictionary<String,Any> else { return }
                guard let iconFiles = iconList["CFBundleIconFiles"] as? [String] else { return }
                guard let icon = iconFiles.first else { return }
                
                iconNames.append(icon)
            }
        }
    }
}
