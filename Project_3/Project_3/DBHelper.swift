//
//  DBHelper.swift
//  Project_3
//
//  Created by admin on 5/24/21.
//

import Foundation
import CoreData
import UIKit

class DBHelper
{
	static var inst = DBHelper()
	
    let context = (UIApplication.shared.delegate as? AppDelegate)? .persistentContainer.viewContext
    
    
    func addUser(object : [String:String]){
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        user.balance = 0.0
        user.username = object["username"]
        user.password = object["password"]
        user.phone = object["phone"]
        user.cartamount = 0.0
        user.recentview = ""
        
        do{
            try context?.save()
            print("Data Save")
            print("", user.username)
            print("",user.password)
        }
        catch{
            print("data not saved")
        }
    }
    
    func addItem(object : [String:String]){
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context!) as! Item
        item.name = object["name"]
        item.price = 0.0
        item.descript = object["description"]
        item.category = object["category"]
       
        do{
            try context?.save()
            print("Data Save")

        }
        catch{
            print("data not saved")
        }
    }
    
    static var found = 0
    
    func getOneUser(user : String) -> User{
        
        var st = User()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq.predicate = NSPredicate(format: "username == %@", user)
        fetchReq.fetchLimit = 1
        do{
            let req = try context?.fetch(fetchReq) as! [User]
            
            if(req.count != 0 ) {
                st = req.first!
                
                DBHelper.found = 1
            } else {
                DBHelper.found = 0
            }
        }
        catch{
            print("Error")
        }
        return st
        
    }
    
    func getOneItem(item : String) -> Item{
        
        var st = Item()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Item")
        fetchReq.predicate = NSPredicate(format: "name == %@", item)
        fetchReq.fetchLimit = 1
        do{
            let req = try context?.fetch(fetchReq) as! [Item]
            
            if(req.count != 0 ) {
                st = req.first!
                
                DBHelper.found = 1
            } else {
                DBHelper.found = 0
            }
        }
        catch{
            print("Error")
        }
        return st
        
    }
    
    func updateUserPassword(object : [String:String]){
        
        var st = User()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq.predicate = NSPredicate(format: "username == %@", object["username"]!)
        
        do{
            let stu = try context?.fetch(fetchReq)
            
            if(stu?.count != 0){
                st = stu?.first as! User
                st.password = object["password"]
                try context?.save()            }
            
        }
        catch{
            print("Error")
        }
        
    }
    
    func updateCart(name : String, item : Item){
        
        var st = User()
        print("st made")
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        print("Fetched")
        fetchReq.predicate = NSPredicate(format: "username == %@", name)
        print("Predicated")
        
        do{
            let stu = try context?.fetch(fetchReq)
            st = stu?.first as! User
            print("It shall try to make relationship")
            st.addToToitem(item)
            try context?.save()
            print("Updated Questions For Quiz")
        }
        catch{
            print("Error")
        }
        
    }
}
