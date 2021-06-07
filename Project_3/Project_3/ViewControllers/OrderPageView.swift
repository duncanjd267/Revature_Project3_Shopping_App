//
//  OrderPageView.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/7/21.
//

import UIKit

class OrderPageView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items : [Item]?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOr") as! OrderPageCell
        print("I am here")
        cell.ItemName.text = items![indexPath.row].name
        cell.ItemPrice.text = String(items![indexPath.row].price)
        cell.ItemImg.image = UIImage(named: items![indexPath.row].image!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    

    override func viewDidLoad() {
        items = DBHelper.inst.getOneUser(user: (DBHelper.inst.getCurrentUser())).purchased as! [Item]
            
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    

}
