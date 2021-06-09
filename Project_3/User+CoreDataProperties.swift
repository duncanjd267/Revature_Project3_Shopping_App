//
//  User+CoreDataProperties.swift
//  
//
//  Created by Kangseok Lee on 6/3/21.
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
    @NSManaged public var toitem: Set<Item>?
    @NSManaged public var history: NSSet?
    @NSManaged public var purchased: Set<Item>?
    @NSManaged public var whishlist: NSSet?

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

// MARK: Generated accessors for history
extension User {

    @objc(addHistoryObject:)
    @NSManaged public func addToHistory(_ value: Item)

    @objc(removeHistoryObject:)
    @NSManaged public func removeFromHistory(_ value: Item)

    @objc(addHistory:)
    @NSManaged public func addToHistory(_ values: NSSet)

    @objc(removeHistory:)
    @NSManaged public func removeFromHistory(_ values: NSSet)

}

// MARK: Generated accessors for purchased
extension User {

    @objc(addPurchasedObject:)
    @NSManaged public func addToPurchased(_ value: Item)

    @objc(removePurchasedObject:)
    @NSManaged public func removeFromPurchased(_ value: Item)

    @objc(addPurchased:)
    @NSManaged public func addToPurchased(_ values: NSSet)

    @objc(removePurchased:)
    @NSManaged public func removeFromPurchased(_ values: NSSet)

}

// MARK: Generated accessors for whishlist
extension User {

    @objc(addWhishlistObject:)
    @NSManaged public func addToWhishlist(_ value: Item)

    @objc(removeWhishlistObject:)
    @NSManaged public func removeFromWhishlist(_ value: Item)

    @objc(addWhishlist:)
    @NSManaged public func addToWhishlist(_ values: NSSet)

    @objc(removeWhishlist:)
    @NSManaged public func removeFromWhishlist(_ values: NSSet)

}

extension User : Identifiable {
    
}
