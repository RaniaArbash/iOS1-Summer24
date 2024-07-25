//
//  Owner+CoreDataProperties.swift
//  ToDO
//
//  Created by Rania Arbash on 2024-07-25.
//
//

import Foundation
import CoreData


extension Owner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Owner> {
        return NSFetchRequest<Owner>(entityName: "Owner")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var yob: Int32
    @NSManaged public var owned: NSSet?

}

// MARK: Generated accessors for owned
extension Owner {

    @objc(addOwnedObject:)
    @NSManaged public func addToOwned(_ value: Car)

    @objc(removeOwnedObject:)
    @NSManaged public func removeFromOwned(_ value: Car)

    @objc(addOwned:)
    @NSManaged public func addToOwned(_ values: NSSet)

    @objc(removeOwned:)
    @NSManaged public func removeFromOwned(_ values: NSSet)

}

extension Owner : Identifiable {

}
