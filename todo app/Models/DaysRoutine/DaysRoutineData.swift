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
        case .sunday:   return "S"
        case .monday:   return "M"
        case .tuesday:  return "T"
        case .wednesday: return "W"
        case .thursday: return "T"
        case .friday:   return "F"
        case .saturday: return "S"
            
        }
    }
}
