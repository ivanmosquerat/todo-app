//
//  RoutinesListView.swift
//  todo app
//
//  Created by Ivan Mosquera on 3/3/21.
//

import SwiftUI

struct RoutinesListView: View {
    var body: some View {
        
        NavigationView{
            
            ZStack {
                List(0..<5) { item in
                    
                    RoutinesItemView()
                    
                }
                .listStyle(InsetListStyle())
            }
            
        }//: Navigation
    }
}

struct RoutinesListView_Previews: PreviewProvider {
    static var previews: some View {
        RoutinesListView()
    }
}
