//
//  User+CoreDataProperties.swift
//  Project_3
//
//  Created by admin on 5/24/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var balance: Double
    @NSManaged public var cartamount: Double
    @NSManaged public var password: String?
    @NSManaged public var phone: String?
    @NSManaged public var recentview: String?
    @NSManaged public var username: String?
    @NSManaged public var toitem: NSSet?

}

// MARK: Generated accessors for toitem
extension User {

    @objc(addToitemObject:)
    @NSManaged public func addToToitem(_ value: Item)

    @objc(removeToitemObject:)
    @NSManaged public func removeFromToitem(_ value: Item)

    @objc(addToitem:)
    @NSManaged public func addToToitem(_ values: NSSet)

    @objc(removeToitem:)
    @NSManaged public func removeFromToitem(_ values: NSSet)

}

extension User : Identifiable {

}
