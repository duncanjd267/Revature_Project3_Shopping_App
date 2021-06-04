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
