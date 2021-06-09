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
    @IBOutlet weak var NoItemView: UIView!
    
    override func viewDidLoad() {
        
        print("Here inside viewDidLoad")
        items = DBHelper.inst.getOneUser(user: (DBHelper.inst.getCurrentUser())).purchased?.allObjects as! [Item]
        NoItemView.isHidden = true
        print(String(items!.count))
        navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()

    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(items!.count == 0){
            
            NoItemView.isHidden = false
            return 0
        }
        else {
            NoItemView.isHidden = true
            return items!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOr") as! OrderPageCell
        cell.ItemName.text = items![indexPath.row].name
        cell.ItemPrice.text = "$" + String(items![indexPath.row].price)
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
    @IBAction func back(_ sender: Any) {
        
        let tabViewController =
            storyboard?.instantiateViewController(withIdentifier: "TabViewControllerUser")
        view.window?.rootViewController = tabViewController
        view.window?.makeKeyAndVisible()
        
    }
    


}
