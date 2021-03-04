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
    case darkOrange
    case darkPurple
    case green
    case lightBlue
    case yellow
    case magenta
    
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
        case .darkOrange: return "DarkOrange"
        case .darkPurple: return "DarkPurple"
        case .green:    return "Green"
        case .lightBlue: return "LightBlue"
        case .yellow:   return "Yellow"
        case .magenta:   return "Magenta"
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
        case .darkOrange: return "Border\(Colors.darkOrange.backgroundColor)"
        case .darkPurple: return "Border\(Colors.darkPurple.backgroundColor)"
        case .green:    return "Border\(Colors.green.backgroundColor)"
        case .lightBlue: return "Border\(Colors.lightBlue.backgroundColor)"
        case .yellow:   return "Border\(Colors.yellow.backgroundColor)"
        case .magenta:   return "Border\(Colors.magenta.backgroundColor)"
        }
    }
}
    
//    ColorRoutine(id: 0, name: "magenta"),
//
//    ColorRoutine(id: 1, name: "orange")
//
    

