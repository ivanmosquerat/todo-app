//
//  Routine+CoreDataProperties.swift
//  todo app
//
//  Created by Ivan Mosquera on 6/3/21.
//
//

import Foundation
import CoreData


extension Routine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Routine> {
        return NSFetchRequest<Routine>(entityName: "Routine")
    }

    @NSManaged public var color: String?
    @NSManaged public var days: [String]?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var task: NSSet?
    
    public var wrappedColor: String {
        color ?? "Orange"
    }
    
    public var wrappedDays: [String] {
        days ?? []
    }
    
    public var wrappedName: String {
        name ?? "Default routine"
    }
    
    public var taskArray: [Task]{
        let set = task as? Set<Task> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for task
extension Routine {

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: Task)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: Task)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSSet)

}

extension Routine : Identifiable {

}
