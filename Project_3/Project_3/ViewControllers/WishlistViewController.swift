//
//  WishlistViewController.swift
//  Project_3
//
//  Created by admin on 6/3/21.
//

import UIKit

class WishlistViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var prob:Bool?
    var brand:[Item]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if DBHelper.inst.getCurrentUser() == "" {
            prob = true
            return 1
        } else if (DBHelper.inst.getOneUser(user: DBHelper.inst.getCurrentUser()).wishlist!.count == 0){
            prob = true
            return 1
        } else {
            prob = false
            return DBHelper.inst.getOneUser(user: DBHelper.inst.getCurrentUser()).wishlist!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  prob == true{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Wcell") as! WishlistTableViewCell
            cell.hName.text = "Either login or add to wishlist"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Wcell") as! WishlistTableViewCell
            cell.hName.text = brand![indexPath.row].name
            cell.hPrice.text = String(brand![indexPath.row].price)
            cell.hImage.image = UIImage(named: brand![indexPath.row].image!)
            
            return cell
            
        }
        
    }
    

    override func viewDidLoad() {
        brand = DBHelper.inst.getOneUser(user: DBHelper.inst.getCurrentUser()).wishlist as! [Item]
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
