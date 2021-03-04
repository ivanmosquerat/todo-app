//
//  ColorRoutineSettings.swift
//  todo app
//
//  Created by Ivan Mosquera on 4/3/21.
//

import SwiftUI

final public class ColorRoutineSettings: ObservableObject {
    @Published var colorBackground: String = "Blue"
    
    private init() {}
    public static let shared = ColorRoutineSettings()
}


