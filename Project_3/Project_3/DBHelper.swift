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
    var currentUser = ""
    var currentItem = ""
    var currentBrand = ""
    
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
    
    func addItem(object : [String:String], price: Double){
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context!) as! Item
        item.name = object["name"]
        item.price = price
        item.numcom = 0
        item.purchased = 0
        item.descript = object["description"]
        item.category = object["category"]
        item.image = object["image"]
        item.image2 = object["image2"]
        item.image3 = object["image3"]
       
        do{
            try context?.save()
            print("Data Save")

        }
        catch{
            print("data not saved")
        }
    }
    //hushhnjh
    func addComment(object: String){
        let item = NSEntityDescription.insertNewObject(forEntityName: "Comments", into: context!) as! Comments
        item.comment = object
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
    
    func getOneComment(user : String) -> Comments{
        
        var st = Comments()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Comments")
        fetchReq.predicate = NSPredicate(format: "comment == %@", user)
        fetchReq.fetchLimit = 1
        do{
            let req = try context?.fetch(fetchReq) as! [Comments]
            
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
    
    func updateItemPurchased(item : String){
        
        var st = Item()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Item")
        fetchReq.predicate = NSPredicate(format: "name == %@", item)
        fetchReq.fetchLimit = 1
        do{
            let req = try context?.fetch(fetchReq) as! [Item]
            
            if(req.count != 0 ) {
                st = req.first!
                st.purchased = st.purchased + 1.0
                
                DBHelper.found = 1
            } else {
                DBHelper.found = 0
            }
        }
        catch{
            print("Error")
        }
        
    }
    
    func updateItemViewed(item : String){
        
        var st = Item()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Item")
        fetchReq.predicate = NSPredicate(format: "name == %@", item)
        fetchReq.fetchLimit = 1
        var ste = User()
        var fetchReq2 = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq2.predicate = NSPredicate(format: "username == %@", currentUser)
        fetchReq2.fetchLimit = 1
        do{
            let req = try context?.fetch(fetchReq) as! [Item]
            let req2 = try context?.fetch(fetchReq2) as! [User]
            if(req.count != 0 ) {
                st = req.first!
                print(st.name)
                ste = req2.first!
                print(ste.username)
                ste.addToHistory(st)
                try context?.save()
                DBHelper.found = 1
            } else {
                DBHelper.found = 0
            }
        }
        catch{
            print("Error")
        }
        
    }
    
    func updateWishlist(item : String){
        
        var st = Item()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Item")
        fetchReq.predicate = NSPredicate(format: "name == %@", item)
        fetchReq.fetchLimit = 1
        var ste = User()
        var fetchReq2 = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq2.predicate = NSPredicate(format: "username == %@", currentUser)
        fetchReq2.fetchLimit = 1
        do{
            let req = try context?.fetch(fetchReq) as! [Item]
            let req2 = try context?.fetch(fetchReq2) as! [User]
            if(req.count != 0 ) {
                st = req.first!
                print(st.name)
                ste = req2.first!
                print(ste.username)
                ste.addToWhishlist(st)
                try context?.save()
                DBHelper.found = 1
            } else {
                DBHelper.found = 0
            }
        }
        catch{
            print("Error")
        }
        
    }
    
    func RemoveWishlist(item : String){
        
        var st = Item()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Item")
        fetchReq.predicate = NSPredicate(format: "name == %@", item)
        fetchReq.fetchLimit = 1
        var ste = User()
        var fetchReq2 = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq2.predicate = NSPredicate(format: "username == %@", currentUser)
        fetchReq2.fetchLimit = 1
        do{
            let req = try context?.fetch(fetchReq) as! [Item]
            let req2 = try context?.fetch(fetchReq2) as! [User]
            if(req.count != 0 ) {
                st = req.first!
                print(st.name)
                ste = req2.first!
                print(ste.username)
                ste.removeFromWhishlist(st)
                try context?.save()
                DBHelper.found = 1
            } else {
                DBHelper.found = 0
            }
        }
        catch{
            print("Error")
        }
        
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
            if stu?.count != 0
            {
                st = stu?.first as! User
                print("It shall try to make relationship")
                st.recentview = item.name
                st.cartamount = st.cartamount + item.price
                st.addToToitem(item)
                print(String(st.toitem!.count))
                try context?.save()
                print("Updated items for cart")
            }
        }
        catch{
            print("Error")
        }
        
    }
    
    func updateComments(name : String, comment : Comments){
        
        var st = Item()
        print("st made")
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Item")
        print("Fetched")
        fetchReq.predicate = NSPredicate(format: "name == %@", name)
        print("Predicated")
        
        do{
            let stu = try context?.fetch(fetchReq)
            st = stu?.first as! Item
            print("It shall try to make relationship")
            st.addToTocomment(comment)
            st.numcom += 1
            try context?.save()
            print("Updated Questions For Quiz")
        }
        catch{
            print("Error")
        }
        
    }
    func getUsers()-> [User]{
        var stu = [User]()
        var fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            stu = try context?.fetch(fetchReq) as!
     [User]
        }
        catch{
            print("cannot fetch the data")
        }
        return stu
    }
    
    func getItems()-> [Item]{
        var stu = [Item]()
        var fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        do{
            stu = try context?.fetch(fetchReq) as!
     [Item]
        }
        catch{
            print("cannot fetch the data")
        }
        return stu
    }
    
    func getItemsBrand(name: String)-> [Item]{
        var stu = [Item]()
        var fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        fetchReq.predicate = NSPredicate(format: "category == %@", name)
        do{
            stu = try context?.fetch(fetchReq) as!
     [Item]
        }
        catch{
            print("cannot fetch the data")
        }
        return stu
    }
    
	func PwordRecover(Pnum: String) -> String
	{
		var st = User()
		var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
		fetchReq.predicate = NSPredicate(format: "phone == %@", Pnum)
		
		do
		{
			let stu = try context?.fetch(fetchReq)
			
			if stu?.count != 0
			{
				st = stu?.first as! User
				return st.password!
			}
		}
		catch
		{
			print("Error: \(error)")
		}
		return "No User found"
	}
    
    func updateCartPurchased(name : String){
        
        var st = User()
        print("st made")
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        print("Fetched")
        fetchReq.predicate = NSPredicate(format: "username == %@", name)
        print("Predicated")
        
        do{
            let stu = try context?.fetch(fetchReq)
            st = stu?.first as! User
            for items in st.toitem!{
                var temp = items as! Item
                DBHelper.inst.updateItemPurchased(item: temp.name!)
                st.removeFromToitem(temp)
                st.addToPurchased(temp)
            }
            st.cartamount = 0.0
            try context?.save()
            
        }
        catch{
            print("Error")
        }
        
    }
    
    func updateCartRemove(name : String, item: Item){
        
        var st = User()
        print("st made")
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        print("Fetched")
        fetchReq.predicate = NSPredicate(format: "username == %@", name)
        print("Predicated")
        
        do{
            let stu = try context?.fetch(fetchReq)
            st = stu?.first as! User
            var ind = st.toitem?.firstIndex(of: item)
                    
            st.managedObjectContext?.delete((st.toitem?[ind!])!)

            //st.removeFromToitem(item)
            st.cartamount = st.cartamount - item.price
            try context?.save()
            
        }
        catch{
            print("Error")
        }
        
    }
    
    var newData : NSMutableSet?
    
    func Refund(name : String, item: Item){
        
        var st = User()
        print("st made")
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        print("Fetched")
        fetchReq.predicate = NSPredicate(format: "username == %@", name)
        print("Predicated")
        
        do{
            let stu = try context?.fetch(fetchReq)
            st = stu?.first as! User
            /*
            print(st.username)
            print(item.name)
            print(String(st.purchased!.count))
            print(st.purchased)
            st.removeFromPurchased(item)
            newData = st.purchased! as! NSMutableSet
            newData?.remove(item)
            newData?.remove(item)
            st.purchased? = newData as! NSSet
            print(st.purchased)
            print(String(st.purchased!.count))
            */
            var ind = st.purchased?.firstIndex(of: item)
                        
            st.managedObjectContext?.delete((st.purchased?[ind!])!)
            st.balance = st.balance + item.price
            try context?.save()
            
        }
        catch{
            print("Error")
        }
 
        
    }
    func holdCurrentUser(name : String){
        currentUser = name
    }
    func getCurrentUser() -> String {
        return currentUser;
    }
    
    func holdCurrentItem(name : String){
        currentItem = name
    }
    func getCurrentItem() -> String {
        return currentItem;
    }
    func holdCurrentBrand(name : String){
        currentBrand = name
    }
    func getCurrentBrand() -> String {
        return currentBrand;
    }

}
