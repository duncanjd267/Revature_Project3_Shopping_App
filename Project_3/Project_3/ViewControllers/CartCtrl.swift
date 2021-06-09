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
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var NoItemView: UIView!
    @IBOutlet weak var PlaceOrder: UIButton!
    
    override func viewDidLoad()
    {
        navigationController?.isNavigationBarHidden = true
        NoItemView.isHidden = true
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
        if (items!.count == 0) {
            NoItemView.isHidden = false
            PlaceOrder.isHidden = true
            return 0
        }else{
            NoItemView.isHidden = true
            PlaceOrder.isHidden = false
            return items!.count
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        cellsel = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thing1") as! CartCell
        print("I am here")
        cell.ItemName.text = items![indexPath.row].name
        cell.ItemPrice.text = "$" + String(items![indexPath.row].price)
        cell.ItemImage.image = UIImage(named: items![indexPath.row].image!)
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    @IBAction func remove(_ sender: Any) {
        DBHelper.inst.updateCartRemove(name: (Person?.username)!, item: items![cellsel])
        
    }
    
    
    @IBAction func Checkout(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "PaymentOption") as! PaymentOptionView
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func Back(_ sender: Any) {
        
        let tabViewController =
            storyboard?.instantiateViewController(withIdentifier: "TabViewControllerUser")
        view.window?.rootViewController = tabViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    
    
}


extension CartCtrl: DataCollectionProtocol {
    
    func deleteData(indx: Int) {
        items?.remove(at: indx)
        TableView.reloadData()
    }
    
}
