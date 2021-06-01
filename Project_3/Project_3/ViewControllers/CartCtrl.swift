//
//  CartCtrl.swift
//  Project_3
//
//  Created by admin on 5/24/21.
//

import UIKit

class CartCtrl: UIViewController, UITableViewDelegate, UITableViewDataSource
{
	
	var items: [Item]?
	var numberInCart: Double?
	var total: Double?
	var Person: User?
	
	func numberOfSections(in tableView: UITableView) -> Int
	{
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return items!.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let cell = tableView.dequeueReusableCell(withIdentifier: "thing1") as! CartTableCell
		return cell
	}
	
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

		let username = DBHelper.inst.getCurrentUser()
		Person = DBHelper.inst.getOneUser(user: username)
		
		items = Person!.toitem!.allObjects as! [Item]
		total = Person!.balance
		numberInCart = Person!.cartamount
    }

}
