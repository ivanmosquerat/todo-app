//
//  Constants.swift
//  todo app
//
//  Created by Ivan Mosquera on 4/3/21.
//

import Foundation
import SwiftUI

// MARK: - Colors
enum Colors: CaseIterable{
    
    case orange
    case blue
    case red
    case pink
    case gray
    case purple
    case cyan
    case magenta
    case indigo
    case teal
    
    var colorName: String {
        switch self {
        case .orange:   return "orange"
        case .blue:     return "blue"
        case .red:      return "red"
        case .pink:     return "pink"
        case .gray:     return "gray"
        case .purple:   return "purple"
        case .cyan:     return "cyan"
        case .magenta:  return "magenta"
        case .indigo:   return "systemIndigo"
        case .teal:     return "systemTeal"
        
        }
    }
    
    var color: UIColor {
        switch self {
        case .orange:   return .systemOrange
        case .blue:     return .systemBlue
        case .red:      return .systemRed
        case .pink:     return .systemPink
        case .gray:     return .systemGray
        case .purple:   return .systemPurple
        case .cyan:     return .cyan
        case .magenta:  return .magenta
        case .indigo:   return .systemIndigo
        case .teal:     return .systemTeal
            
        }
    }
}
