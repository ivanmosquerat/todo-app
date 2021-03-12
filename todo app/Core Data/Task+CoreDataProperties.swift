//
//  Task+CoreDataProperties.swift
//  todo app
//
//  Created by Ivan Mosquera on 6/3/21.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var priority: String?
    @NSManaged public var routine: Routine?
    
    public var wrappedCompleted: Bool {
        completed
    }
    
    public var wrappedDate: Date{
        date ?? Date()
    }
    
    public var wrappedName: String{
        name ?? "Default task"
    }
    
    public var wrappedRoutine: Routine{
        routine ?? Routine()
    }
    
    public var wrappedPriority: String{
        priority ?? "Normal"
    }

}

extension Task : Identifiable {

}
