//
//  TasksListView.swift
//  todo app
//
//  Created by Ivan Mosquera on 5/3/21.
//

import SwiftUI

struct TasksListView: View {
    
    // MARK: - Properties
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.name, ascending: true)]) var tasks: FetchedResults<Task>
    @State private var showingAddTodoView: Bool = false
    
    @ObservedObject var theme = ThemeSettings.shared
    
    var themes: [Theme] = themeData
    var routine: Routine
    
    // MARK: - Body
    var body: some View {
        
         ZStack{
            
            List{
            
                ForEach(routine.taskArray, id: \.self){ todo in
                    HStack{
                        
                        Text(todo.priority ?? "Undefined")
                            .font(.footnote)
                            .foregroundColor(colorize(priority: todo.priority ?? "Normal"))
                            .padding(3)
                            .frame(minWidth: 62)
                            .overlay(
                                Capsule().stroke(colorize(priority: todo.priority ?? "Normal"), lineWidth: 0.75)
                            )
                        
                        Text(todo.name ?? "Unknown")
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Button(action:{
                            
                        }){
                            
                        }
                        
                        
                    }//: HStack
                    .padding(.vertical, 10)
                }//: Loop
                .onDelete(perform: deleteTask)
                
            }//: List
            .listStyle(InsetListStyle())
            .navigationBarTitle("Tasks", displayMode: .inline)
            .navigationBarItems(
                
                trailing:

                    Button(action: {
                        showingAddTodoView.toggle()
                    }){
                    Image(systemName: "plus")
                        .imageScale(.large)
                    }
                    .sheet(isPresented: $showingAddTodoView, content: {
                        AddTodoView( routine: routine)
                            .environment(\.managedObjectContext, self.viewContext)
                    })
                )//: NavItem
            
            // MARK: - No task items
            if tasks.count == 0 {
                EmptyListView()
            }
        }//: ZStack
    }
    
    // MARK: - Functions
    
    private func colorize(priority: String) -> Color{
        switch priority {
        case "High":
            return .pink
        case "Normal":
            return .green
        case "Low":
            return .blue
        default:
            return .gray
        }
    }
    
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
struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        TasksListView(routine: Routine())
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
