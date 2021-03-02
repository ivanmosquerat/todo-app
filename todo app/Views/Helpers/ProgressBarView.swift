//
//  ProgressBarView.swift
//  todo app
//
//  Created by Ivan Mosquera on 2/3/21.
//

import SwiftUI

struct ProgressBarView: View {
    var body: some View {
       
        ZStack(alignment: .leading) {
            
            Capsule(style: .continuous)
                .frame(width: 210 , height: 27, alignment: .topLeading)
                .foregroundColor(.gray)
                .padding(.leading, 1)
            
            Capsule(style: .continuous)
                .stroke(Color(UIColor.blue), lineWidth: 3)
                .frame(width: UIApplication.shared.windows.first?.safeAreaInsets.right, height: 30)
                .overlay(
                    Text("\(80)%")
                        .foregroundColor(.black)
                        .padding()
                )
        }//: ZStack
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
            .previewLayout(.sizeThatFits)
            .padding(8)
    }
}
