//
//  ProgressBarView.swift
//  todo app
//
//  Created by Ivan Mosquera on 2/3/21.
//

import SwiftUI

struct ProgressBarView: View {
    
    // MARK: - Properties
    @State var isBarAnimating = false
    let widthBar = UIScreen.main.bounds.width - 36
    var colorBackground: String
    var tasks: [Task]
    
    // MARK: - Body
    var body: some View {
       
        ZStack(alignment: .leading) {
            
            Capsule(style: .continuous)
                .frame(width: isBarAnimating ? (widthBar * 0.8) : 0 , height: 23, alignment: .topLeading)
                .foregroundColor(Color(colorBackground))
                .padding(.leading, 1)
                .onAppear(perform: {
                    withAnimation(.easeIn(duration: 1)){
                        
                        if !isBarAnimating{
                            isBarAnimating.toggle()
                        }
                        
                    }
                })
            
            Capsule(style: .continuous)
                .stroke(Color("Border\(colorBackground)"), lineWidth: 2)
                .frame(width: widthBar, height: 25)
                .overlay(
                    Text("\(Int(((widthBar * 0.8)/widthBar)*100))%")
                        .foregroundColor(setTextColor(value: Double((widthBar * 0.8)) ))
                        
                )
        }//: ZStack
        
    }
    
    func setTextColor(value: Double) -> Color {
        if(value >= Double((widthBar * 0.55)) ){
            return .white
        }
        return.black
    }
}

// MARK: - Preview
struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(colorBackground: "Teal", tasks: [])
            .previewLayout(.sizeThatFits)
            
    }
}
