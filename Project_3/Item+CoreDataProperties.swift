//
//  Item+CoreDataProperties.swift
//  
//
//  Created by Kangseok Lee on 6/3/21.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var category: String?
    @NSManaged public var descript: String?
    @NSManaged public var image: String?
    @NSManaged public var image2: String?
    @NSManaged public var image3: String?
    @NSManaged public var name: String?
    @NSManaged public var numcom: Double
    @NSManaged public var price: Double
    @NSManaged public var purchased: Double
    @NSManaged public var tocomment: NSSet?

}

// MARK: Generated accessors for tocomment
extension Item {

    @objc(addTocommentObject:)
    @NSManaged public func addToTocomment(_ value: Comments)

    @objc(removeTocommentObject:)
    @NSManaged public func removeFromTocomment(_ value: Comments)

    @objc(addTocomment:)
    @NSManaged public func addToTocomment(_ values: NSSet)

    @objc(removeTocomment:)
    @NSManaged public func removeFromTocomment(_ values: NSSet)

}
