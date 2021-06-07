//
//  CartCtrl.swift
//  Project_3
//
//  Created by admin on 5/24/21.
//

import UIKit

class CartCtrl: UIViewController
{
	var items: [Item]?
	var numberInCart: Double?
	var total: Double?
	var Person: User?
	
	
	func PurchaseItems()
	{
		let Uname = Person!.username!
		items!.removeAll()
		numberInCart = 0
		total = 0
		DBHelper.inst.updateCartPurchased(name: Uname)
	}
	
	func removeItem()
	{
		
	}
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
		let username = DBHelper.inst.getCurrentUser()
		Person = DBHelper.inst.getOneUser(user: username)
		
		items = Person!.toitem!.allObjects as! [Item]
		total = Person!.balance
		numberInCart = Person!.cartamount
    }

}
