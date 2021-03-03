//
//  RoutinesListView.swift
//  todo app
//
//  Created by Ivan Mosquera on 3/3/21.
//

import SwiftUI

struct RoutinesListView: View {
    
    // MARK: - Properties
    @ObservedObject var theme = ThemeSettings.shared
    @State var isShowingCreateRoutine: Bool = false
    var themes: [Theme] = themeData
    
    // MARK: - Body
    var body: some View {
        
        NavigationView{
            
            VStack {
                List(0..<2) { item in
                    
                    RoutinesItemView()
                }//: List
                .listStyle(InsetListStyle())
            }//: VStack
            .navigationBarTitle("Routines")
            
            .overlay(
            
                ZStack{
                    Button(action: {
                        isShowingCreateRoutine.toggle()
                    }, label: {
                        
                        HStack(alignment: .center, spacing: 5){
                            Text("Create routine")
                                .font(.system(size: 20, weight: .bold))
                                .padding(.vertical, 12)
                                
                            Image(systemName: "plus.circle")
                                .font(.title3)
                                
                        }
                        
                    })//: Add button
                }//: ZStack
                .frame(minWidth: 140, maxWidth: 180)
                .background(themes[theme.themeSettings].themeColor)
                .foregroundColor(.white)
                .cornerRadius(8)
                .sheet(isPresented: $isShowingCreateRoutine, content: {
                    CreateRoutineView()
                })
                , alignment: .bottom)
        
            
        }//: Navigation
    }
}

struct RoutinesListView_Previews: PreviewProvider {
    static var previews: some View {
        RoutinesListView()
    }
}
