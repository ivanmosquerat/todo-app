//
//  DaysRoutineData.swift
//  todo app
//
//  Created by Ivan Mosquera on 4/3/21.
//

import SwiftUI

enum Days: CaseIterable{
    
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    
    var code: String{
        switch self {
        case .sunday:   return "Su"
        case .monday:   return "M"
        case .tuesday:  return "Tu"
        case .wednesday: return "W"
        case .thursday: return "Th"
        case .friday:   return "F"
        case .saturday: return "Sa"
            
        }
    }
    
    var index: Int{
        switch self {
        case .sunday:   return 1
        case .monday:   return 2
        case .tuesday:  return 3
        case .wednesday: return 4
        case .thursday: return 5
        case .friday:   return 6
        case .saturday: return 7
    
        }
    }
}
