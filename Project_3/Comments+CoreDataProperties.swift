//
//  Comments+CoreDataProperties.swift
//  
//
//  Created by Kangseok Lee on 6/3/21.
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
