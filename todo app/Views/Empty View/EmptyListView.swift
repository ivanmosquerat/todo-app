//
//  EmptyListView.swift
//  todo app
//
//  Created by Ivan Mosquera on 28/2/21.
//

import SwiftUI

struct EmptyListView: View {
    // MARK: - Properties
    @State private var isAnimated: Bool = false
    let images: [String] = ["illustration-no1", "illustration-no2", "illustration-no3"]
    let tips: [String] = ["Use your time wisely."]
    
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Theme] = themeData
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Image(images.randomElement() ?? self.images[0])
                    //.renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
                    .layoutPriority(1)
                    //.foregroundColor(self.themes[theme.themeSettings].themeColor)
                
                Text(tips.randomElement() ?? self.tips[0])
                    .layoutPriority(0.5)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(self.themes[theme.themeSettings].themeColor)
            }//: VStack
            .padding(.horizontal)
            .opacity(1)
            .offset(y: 0 )
            
        }//: ZStack
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - Preview
struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
            .environment(\.colorScheme, .light)
    }
}
