//
//  OrderPageView.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/7/21.
//

import UIKit

class OrderPageView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items : [Item]?
    var selected = 0
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOr") as! OrderPageCell
        cell.ItemName.text = items![indexPath.row].name
        cell.ItemPrice.text = String(items![indexPath.row].price)
        cell.ItemImg.image = UIImage(named: items![indexPath.row].image!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    @IBAction func Refund(_ sender: Any) {
        var item = DBHelper.inst.getOneItem(item: items![selected].name!)
        print(item.name!)
        print(String(DBHelper.inst.getOneUser(user: DBHelper.inst.getCurrentUser()).balance))
        DBHelper.inst.Refund(name: DBHelper.inst.getCurrentUser(), item: item)
        print(String(DBHelper.inst.getOneUser(user: DBHelper.inst.getCurrentUser()).balance))
    }
    
    override func viewDidLoad() {
        print("Here inside viewDidLoad")
        items = DBHelper.inst.getOneUser(user: (DBHelper.inst.getCurrentUser())).purchased?.allObjects as! [Item]
        
        print(String(items!.count))
            
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    

}
