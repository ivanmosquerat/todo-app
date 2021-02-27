//
//  AddTodoView.swift
//  todo app
//
//  Created by Ivan Mosquera on 27/2/21.
//

import SwiftUI

struct AddTodoView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    // MARK: - Body
    var body: some View {
        
        NavigationView{
            VStack {
                
                Form{
                    TextField("Todo", text: $name)
                    
                    Picker("Priority", selection: $priority){
                        ForEach(priorities, id: \.self){
                            Text($0)
                        }
                    }//: Picker
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Button(action: {
                        print("Save")
                    }, label: {
                        Text("Save")
                    })//: Button
                }//: Form
                
                Spacer()
                
            }//: VStack
            .navigationBarTitle("New task", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "xmark")
                })
        }//: Navigation
        
    }
}

// MARK: - Preview
struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
