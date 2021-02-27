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
    @State private var showingAddTodoView: Bool = false

    // MARK: - Body
    var body: some View {
        
        NavigationView{
            
            List(0..<5) { item in
                Text("Hello world")
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
            })
            
        }//: Navigation
        
        
    }

}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
