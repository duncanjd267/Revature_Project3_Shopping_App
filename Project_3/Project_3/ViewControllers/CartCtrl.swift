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
    var cellsel = 0
    
    override func viewDidLoad()
    {
        navigationController?.isNavigationBarHidden = true
        let username = DBHelper.inst.getCurrentUser()
        Person = DBHelper.inst.getOneUser(user: username)
    
        
        items = Person!.toitem?.allObjects as! [Item]
        print(String(items!.count))
        total = Person!.balance
        numberInCart = Person!.cartamount
        super.viewDidLoad()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return items!.count
	}
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        cellsel = indexPath.row
    }
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let cell = tableView.dequeueReusableCell(withIdentifier: "thing1") as! CartCell
		print("I am here")
		cell.ItemName.text = items![indexPath.row].name
		cell.ItemPrice.text = String(items![indexPath.row].price)
        cell.ItemImage.image = UIImage(named: items![indexPath.row].image!)
		return cell
	}
    
    @IBAction func remove(_ sender: Any) {
        DBHelper.inst.updateCartRemove(name: (Person?.username)!, item: items![cellsel])
    }
    
    
    @IBAction func Checkout(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "PaymentOption") as! PaymentOptionView
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150.0
        }
    
    
    
}
