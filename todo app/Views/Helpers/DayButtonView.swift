//
//  DayButtonView.swift
//  todo app
//
//  Created by Ivan Mosquera on 4/3/21.
//

import SwiftUI

struct DayButtonView: View {
    // MARK: - Properties
    @State private var isDaySelected: Bool = false
    @ObservedObject var theme = ThemeSettings.shared
    @ObservedObject var daysRoutine = DaysRoutine.shared
    
    var day: Days
    var themes: [Theme] = themeData
    
    // MARK: - Body
    var body: some View {
        
        Button(action:{
            
            if !daysRoutine.days.contains(day) && !isDaySelected{
                daysRoutine.days.append(day)
            }else{
                daysRoutine.days.removeLast(1)
            }
            
            isDaySelected.toggle()
            
        }){

            Text(day.code)
                .fontWeight(.bold)
                .foregroundColor(isDaySelected ? .white : themes[theme.themeSettings].themeColor)
                .frame(width: 45, height: 45, alignment: .center)
                .background( isDaySelected ? themes[theme.themeSettings].themeColor : Color(UIColor.systemGray5))
                .cornerRadius(12)
                    
        }//: Button
    }
}

struct DayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DayButtonView(day: Days.allCases[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
