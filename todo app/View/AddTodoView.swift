//
//  AddTodoView.swift
//  todo app
//
//  Created by Ivan Mosquera on 27/2/21.
//

import SwiftUI

struct AddTodoView: View {
    // MARK: - Properties
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    
    let priorities = ["High", "Normal", "Low"]
    
    // MARK: - Body
    var body: some View {
        
        NavigationView{
            VStack {
                
                VStack(alignment: .leading, spacing: 20){
                    
                    TextField("Task name", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(8)
                        .font(.system(size: 18, weight: .semibold, design: .default))
                    
                    Picker("Priority", selection: $priority){
                        ForEach(priorities, id: \.self){
                            Text($0)
                        }
                    }//: Picker
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Button(action: {
                        
                        if self.name != "" {
                            let todo = Todo(context: self.viewContext)
                            todo.name = self.name
                            todo.priority = self.priority
                            
                            do{
                                try self.viewContext.save()
                               
                            }catch{
                                print(error)
                            }
                            
                        }else{
                            errorShowing = true
                            errorTitle = "Invalid Name"
                            errorMessage = "Make sure to enter somenthing."
                            
                            return
                        }
                        
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        Text("Save Task")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                    })//: Button
                }//: VStack
                .padding(.horizontal)
                .padding(.vertical, 30)
                
                Spacer()
                
            }//: VStack
            .navigationBarTitle("New task", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "xmark")
                })
            .alert(isPresented: $errorShowing, content: {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Ok")))
            })
        }//: Navigation
        
    }
}

// MARK: - Preview
struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
            .preferredColorScheme(.dark)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
