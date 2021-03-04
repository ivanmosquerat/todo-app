//
//  ColorRoutinesData.swift
//  todo app
//
//  Created by Ivan Mosquera on 4/3/21.
//

import SwiftUI

// MARK: - Colors
enum Colors: CaseIterable{
    
    case orange
    case blue
    case red
    case pink
    case blueGray
    case purple
    case cyan
    case amber
    case indigo
    case teal
    
    var backgroundColor: String {
        switch self {
        case .orange:   return "Orange"
        case .blue:     return "Blue"
        case .red:      return "Red"
        case .pink:     return "Pink"
        case .blueGray: return "BlueGray"
        case .purple:   return "Purple"
        case .cyan:     return "Cyan"
        case .amber:    return "Amber"
        case .indigo:   return "Indigo"
        case .teal:     return "Teal"
        
        }
    }
    
    var borderBorder: String {
        switch self {
        case .orange:   return "Border\(Colors.orange.backgroundColor)"
        case .blue:     return "Border\(Colors.blue.backgroundColor)"
        case .red:      return "Border\(Colors.red.backgroundColor)"
        case .pink:     return "Border\(Colors.pink.backgroundColor)"
        case .blueGray: return "Border\(Colors.blueGray.backgroundColor)"
        case .purple:   return "Border\(Colors.purple.backgroundColor)"
        case .cyan:     return "Border\(Colors.cyan.backgroundColor)"
        case .amber:    return "Border\(Colors.amber.backgroundColor)"
        case .indigo:   return "Border\(Colors.indigo.backgroundColor)"
        case .teal:     return "Border\(Colors.teal.backgroundColor)"
            
        }
    }
}
    
//    ColorRoutine(id: 0, name: "magenta"),
//
//    ColorRoutine(id: 1, name: "orange")
//
    

