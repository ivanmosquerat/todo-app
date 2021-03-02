//
//  ThemeSettings.swift
//  todo app
//
//  Created by Ivan Mosquera on 2/3/21.
//

import SwiftUI

class ThemeSettings: ObservableObject {
    @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme"){
        didSet{
            UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
        }
    }
}
