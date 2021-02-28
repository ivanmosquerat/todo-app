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
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var tasks: FetchedResults<Todo>
    @State private var showingAddTodoView: Bool = false

    // MARK: - Body
    var body: some View {
        
        NavigationView{
            
            ZStack {
                List{
                    ForEach(self.tasks, id: \.self){ todo in
                        HStack{
                            Text(todo.name ?? "Unknown")
                            
                            Spacer()
                            
                            Text(todo.priority ?? "Undefined")
                        }
                    }//: Loop
                    .onDelete(perform: deleteTask)
                }//: List
                .listStyle(InsetListStyle())
                .navigationBarTitle("Task", displayMode: .inline)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(action: {
                    self.showingAddTodoView.toggle()
                }, label: {
                    Image(systemName: "plus")
                }))
                .sheet(isPresented: $showingAddTodoView, content: {
                    AddTodoView()
                        .environment(\.managedObjectContext, self.viewContext)
                })
                
                // MARK: - No task items
                if tasks.count == 0 {
                    EmptyListView()
                }
            }//: ZStack
            
        }//: Navigation
    }
    
    // MARK: - Functions
    
    
    /// <#Description#>
    /// - Parameter offsets: <#offsets description#>
    private func deleteTask(at offsets: IndexSet){
        for index in offsets{
            let task = tasks[index]
            viewContext.delete(task)
            
            do{
                try viewContext.save()
            }catch{
                print(error)
            }
        }
    }

}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
