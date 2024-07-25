//
//  Task+CoreDataProperties.swift
//  ToDO
//
//  Created by Rania Arbash on 2024-07-25.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int16
    @NSManaged public var date: Date?
    @NSManaged public var isUrgent: Bool

}

extension Task : Identifiable {

}
