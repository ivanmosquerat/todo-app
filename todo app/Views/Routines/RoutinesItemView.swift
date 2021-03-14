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
    var routine: Routine
    var themes: [Theme] = themeData
    var days = Days.allCases
    
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading){
            HStack {
                Text(routine.name ?? "Unknown")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                
            }//: HStack
            .padding(.vertical, 2)
            
            HStack{
                ForEach(days, id:\.self) { item in
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill( routine.days?.contains(item.code) ?? false ? Color(routine.color ?? "Orange") : Color(UIColor.systemGray5))
                            .frame(width: 35, height: 35, alignment: .center)
                        
                        Text(item.code)
                            .foregroundColor(routine.days?.contains(item.code) ?? false ? .white : Color(routine.color ?? "Orange"))
                            .fontWeight(.semibold)
                    }
                }
            }//: HStack
            .padding(.vertical, 8)
            
            ProgressBarView(colorBackground: routine.color ?? "Orange", tasks: routine.taskArray)
            
        }//: VStack
        .padding(.vertical, 10)
        
    }
}

// MARK: - Preview
struct RoutinesItemView_Previews: PreviewProvider {
    static var previews: some View {
        RoutinesItemView(routine: Routine())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
