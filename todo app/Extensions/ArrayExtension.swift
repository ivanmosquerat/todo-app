//
//  ArrayExtension.swift
//  todo app
//
//  Created by Ivan Mosquera on 5/3/21.
//

import SwiftUI

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element]{
        
        var addedArray = [Element:Bool]()
        
        return filter{
            addedArray.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicate(){
        self = self.removingDuplicates()
    }
}
