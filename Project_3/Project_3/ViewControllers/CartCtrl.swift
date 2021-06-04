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
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return items!.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let cell = tableView.dequeueReusableCell(withIdentifier: "thing1") as! CartCell
		
		cell.ItemName.text = items![indexPath.row].name
		cell.ItemPrice.text = String(items![indexPath.row].price)
		return cell
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
