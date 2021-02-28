//
//  ContentView.swift
//  todo app
//
//  Created by Ivan Mosquera on 27/2/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // MARK: - Properties
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
    @State private var showingAddTodoView: Bool = false

    // MARK: - Body
    var body: some View {
        
        NavigationView{
            
            List{
                ForEach(self.todos, id: \.self){ todo in
                    HStack{
                        Text(todo.name ?? "Unknown")
                        
                        Spacer()
                        
                        Text(todo.priority ?? "Undefined")
                    }
                }//: Loop
            }//: List
            .listStyle(InsetListStyle())
            .navigationBarTitle("Task", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showingAddTodoView.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showingAddTodoView, content: {
                AddTodoView()
                    .environment(\.managedObjectContext, self.viewContext)
            })
            
        }//: Navigation
        
    }

}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
