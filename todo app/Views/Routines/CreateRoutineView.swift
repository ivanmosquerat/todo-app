//
//  CreateRoutineView.swift
//  todo app
//
//  Created by Ivan Mosquera on 3/3/21.
//

import SwiftUI

struct CreateRoutineView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var isDaySelected: Bool = false
    
    @ObservedObject var theme = ThemeSettings.shared
    
    private let days = ["S", "M", "T", "W", "T", "F", "S"]
    
    var themes: [Theme] = themeData
    
    
    
    // MARK: - Body
    var body: some View {
        NavigationView{
            VStack{
                
                VStack(alignment:.leading, spacing: 20){
                    
                    TextField("Routine name", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(8)
                        .font(.system(size: 18, weight: .semibold, design: .default))
                    
                    Text("Days")
                        .font(.title2)
                        .fontWeight(.semibold)
                    // Days
                    HStack(spacing: 6){
                        ForEach(0..<7){ item in
                            
                            DayButtonView(dayString: days[item])
                            
                        }
                    }//: HStack
                    
                    Text("Color")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    // Grid colors
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHGrid(rows: gridLayout, alignment: .center , spacing: 12, content: {
                            
                            ForEach(0..<14){ item in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.blue)
                                    .frame(width: 45, height: 45, alignment: .center)
                            }
                            
                        })//: Grid
                    }//: Scroll
                    .frame(width: .infinity, height: 100, alignment: .center)
                    
                    
                    
                    Button(action: {
                        print("create routine")
                        
                    }, label: {
                        Text("Create Routine")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(themes[theme.themeSettings].themeColor)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    })
                    
                }//: VStack
                .padding()
                
                Spacer()
            }//: VStack
            .padding()
            .padding(.vertical, 20)
            .navigationBarTitle("Create routine", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .accentColor(themes[theme.themeSettings].themeColor)
                }
            )
        }//: Navigation
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Preview
struct CreateRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoutineView()
            .previewDevice("iPhone 12")
    }
}
