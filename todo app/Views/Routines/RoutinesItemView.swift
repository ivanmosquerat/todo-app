//
//  RoutinesItemView.swift
//  todo app
//
//  Created by Ivan Mosquera on 2/3/21.
//

import SwiftUI

struct RoutinesItemView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading){
            HStack {
                Text("Routine name")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
            }//: HStack
            
            ProgressBarView()
        }//: VStack
        
    }
}

// MARK: - Preview
struct RoutinesItemView_Previews: PreviewProvider {
    static var previews: some View {
        RoutinesItemView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
