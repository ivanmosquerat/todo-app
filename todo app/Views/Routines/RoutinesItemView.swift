//
//  RoutinesItemView.swift
//  todo app
//
//  Created by Ivan Mosquera on 2/3/21.
//

import SwiftUI

struct RoutinesItemView: View {
    // MARK: - Properties
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Theme] = themeData
    
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading){
            HStack {
                Text("List name")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                
            }//: HStack
            .padding(.vertical, 2)
            
            HStack{
                ForEach(0..<7) { item in
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(UIColor.systemGray5))
                            .frame(width: 35, height: 35, alignment: .center)
                        
                        Text("S")
                            .foregroundColor(themes[theme.themeSettings].themeColor)
                            .fontWeight(.semibold)
                    }
                }
            }//: HStack
            .padding(.vertical, 8)
            
            
            
            ProgressBarView()
            
        }//: VStack
        .padding(.vertical, 10)
        
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
