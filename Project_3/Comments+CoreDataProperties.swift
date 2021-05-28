//
//  Comments+CoreDataProperties.swift
//  Project_3
//
//  Created by admin on 5/28/21.
//
//

import Foundation
import CoreData


extension Comments {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comments> {
        return NSFetchRequest<Comments>(entityName: "Comments")
    }

    @NSManaged public var comment: String?

}

extension Comments : Identifiable {

}
