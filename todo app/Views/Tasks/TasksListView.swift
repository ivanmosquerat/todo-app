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
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            ZStack{
                
                List{
                    ForEach(self.tasks, id: \.self){ todo in
                        HStack{
                            
                            Circle()
                                .frame(width: 12, height: 12, alignment: .center)
                                .foregroundColor(colorize(priority: todo.priority ?? "Normal"))
                            
                            Text(todo.name ?? "Unknown")
                                .fontWeight(.semibold)
                            
                            Spacer()
                             
                            Text(todo.priority ?? "Undefined")
                                .font(.footnote)
                                .foregroundColor(Color(UIColor.systemGray2))
                                .padding(3)
                                .frame(minWidth: 62)
                                .overlay(
                                    Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                                )
                        }//: HStack
                        .padding(.vertical, 10)
                    }//: Loop
                    .onDelete(perform: deleteTask)
                    
                }//: List
                .listStyle(InsetListStyle())
                .navigationBarTitle("Tasks", displayMode: .inline)
                .navigationBarItems(leading:
                    Button(action: {
                        // TODO: - SORT FUCNTION
                    }){
                        Image(systemName: "arrow.up.arrow.down")
                            .imageScale(.large)
                    }
                    
                    ,trailing:
                        
                        HStack {
                            
                            Button(action: {
                            // TODO: - SORT FUCNTION
                            }){
                            Image(systemName: "plus")
                                .imageScale(.large)
                            }
                        
                        }
                )
                
                // MARK: - No task items
                if tasks.count == 0 {
                    EmptyListView()
                }
                
            }//: ZStack
            
        }//: Navigation
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
        TasksListView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
