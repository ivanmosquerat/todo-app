//
//  RoutinesListView.swift
//  todo app
//
//  Created by Ivan Mosquera on 3/3/21.
//

import SwiftUI

struct RoutinesListView: View {
    
    // MARK: - Properties
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var theme = ThemeSettings.shared
    @State var isShowingCreateRoutine: Bool = false
    
    @FetchRequest(entity: Routine.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Routine.name, ascending: true)]) var routines: FetchedResults<Routine>
    
    var themes: [Theme] = themeData
    
    // MARK: - Body
    var body: some View {
        
        NavigationView{
            
            VStack {
                List{
                    
                    ForEach(self.routines, id: \.self){ routine in
                        
                        RoutinesItemView(routine: routine)
                    }
                    .onDelete(perform: deleteRoutine)
                    
                }//: List
                .listStyle(InsetListStyle())
                
            }//: VStack
            .navigationBarTitle("Routines", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    isShowingCreateRoutine.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                })
            )
            
//            .overlay(
//
//                ZStack{
//                    Button(action: {
//                        isShowingCreateRoutine.toggle()
//                    }, label: {
//
//                        HStack(alignment: .center, spacing: 5){
//                            Text("Create routine")
//                                .font(.system(size: 20, weight: .bold))
//                                .padding(.vertical, 12)
//
//                            Image(systemName: "plus.circle")
//                                .font(.title3)
//
//                        }
//
//                    })//: Add button
//                }//: ZStack
//                .frame(minWidth: 140, maxWidth: 180)
//                .background(themes[theme.themeSettings].themeColor)
//                .foregroundColor(.white)
//                .cornerRadius(8)
                .sheet(isPresented: $isShowingCreateRoutine, content: {
                    CreateRoutineView()
                })
//                , alignment: .bottom)
        }//: Navigation
    }
    
    private func deleteRoutine(at offsets: IndexSet){
        for index in offsets{
            let routine = routines[index]
            viewContext.delete(routine)
            
            do{
                try viewContext.save()
            }catch{
                print()
            }
        }
    }
}

struct RoutinesListView_Previews: PreviewProvider {
    static var previews: some View {
        RoutinesListView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
