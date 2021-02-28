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
    @State private var animatingButton: Bool = false

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
                .navigationBarItems( leading: EditButton())
                
                
                // MARK: - No task items
                if tasks.count == 0 {
                    EmptyListView()
                }
            }//: ZStack
            .sheet(isPresented: $showingAddTodoView, content: {
                AddTodoView()
                    .environment(\.managedObjectContext, self.viewContext)
            })
            .overlay(
                
                ZStack(alignment: .center) {
                    Button(action: {
                        showingAddTodoView.toggle()
                    }, label: {
                        
                        HStack(alignment: .center, spacing: 5){
                            Text("Add Task")
                                .font(.system(size: 20, weight: .bold))
                                .padding(.vertical, 12)
                                
                            Image(systemName: "plus.circle")
                                .font(.title3)
                        }
                        
                    })//: Add button
                    .frame(minWidth: 100, maxWidth: 140)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                    
                }//: ZStack
                .padding(.bottom, 20)
                , alignment: .bottom
            )//: Overlay
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
        Group {
            ContentView()
                .preferredColorScheme(.dark)
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
            
        }
    }
}
