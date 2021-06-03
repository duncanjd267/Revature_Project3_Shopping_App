//
//  User+CoreDataProperties.swift
//  Project_3
//
//  Created by admin on 6/2/21.
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
    @NSManaged public var purchased: NSSet?
    @NSManaged public var history: NSSet?
    @NSManaged public var wishlist: NSSet?

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

// MARK: Generated accessors for wishlist
extension User {

    @objc(addWishlistObject:)
    @NSManaged public func addToWishlist(_ value: Item)

    @objc(removeWishlistObject:)
    @NSManaged public func removeFromWishlist(_ value: Item)

    @objc(addWishlist:)
    @NSManaged public func addToWishlist(_ values: NSSet)

    @objc(removeWishlist:)
    @NSManaged public func removeFromWishlist(_ values: NSSet)

}

extension User : Identifiable {

}
