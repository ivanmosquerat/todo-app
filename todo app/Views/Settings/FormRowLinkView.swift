//
//  FormRowLinkView.swift
//  todo app
//
//  Created by Ivan Mosquera on 1/3/21.
//

import SwiftUI

struct FormRowLinkView: View {
    // MARK: - Properties
    var icon: String
    var color: Color
    var text: String
    var link: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(.white)
            }//: ZStack
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(text)
                .foregroundColor(.gray)
            
            Spacer()
            
            Button(action: {
                guard let url = URL(string: link), UIApplication.shared.canOpenURL(url) else {
                    return
                }
                
                UIApplication.shared.open(url)
            }){
                Image(systemName: "chevron.right")
                    .font(.system(size:14, weight: .semibold, design: .rounded))
                    .accentColor(Color(.systemGray2))
            }
        }
    }
}

// MARK: - Preview
struct FormRowLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://swift.org")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
