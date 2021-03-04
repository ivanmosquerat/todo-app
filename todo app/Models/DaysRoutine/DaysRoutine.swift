//
//  DaysRoutine.swift
//  todo app
//
//  Created by Ivan Mosquera on 4/3/21.
//

import SwiftUI

final public class DaysRoutine: ObservableObject {
    
    @Published var days: [Days] = []
    
    private init() {}
    public static let shared = DaysRoutine()
}
