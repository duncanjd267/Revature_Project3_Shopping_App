//
//  Item+CoreDataProperties.swift
//  Project_3
//
//  Created by admin on 5/22/21.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var category: String?
    @NSManaged public var descript: String?

}

extension Item : Identifiable {

}
