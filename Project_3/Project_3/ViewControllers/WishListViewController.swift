//
//  WhishListViewController.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/3/21.
//

import UIKit

class WishListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var prob:Bool?
    var brand:[Item]?
    
    @IBOutlet weak var NoItemView: UIView!
    
    override func viewDidLoad() {
        brand = DBHelper.inst.getOneUser(user: DBHelper.inst.getCurrentUser()).whishlist?.allObjects as! [Item]
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        NoItemView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if DBHelper.inst.getCurrentUser() == "" {
            prob = true
            return 1
        } else if (DBHelper.inst.getOneUser(user: DBHelper.inst.getCurrentUser()).whishlist!.count == 0){
            NoItemView.isHidden = false
            prob = true
            return 1
        } else {
            prob = false
            NoItemView.isHidden = true
            return DBHelper.inst.getOneUser(user: DBHelper.inst.getCurrentUser()).whishlist!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  prob == true{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Wish") as! WishlistTableCell
            cell.hName.text = "Either login or add to wishlist"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Wish") as! WishlistTableCell
            cell.hName.text = brand![indexPath.row].name
            cell.hPrice.text = "$" + String(brand![indexPath.row].price)
            cell.hImage.image = UIImage(named: brand![indexPath.row].image!)
            
            return cell
        
    }
    
  

    }

}
