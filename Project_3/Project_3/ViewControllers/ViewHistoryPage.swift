//
//  ViewHistoryPage.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/2/21.
//

import UIKit

class ViewHistoryPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    var testImg = ["AdidasLogo", "AppleLogo", "GucciLogo"]
    var testLabel = ["Adidas Shoes", "iphone", "Gucci Bag"]
    var testPrice = ["0.00", "12.11", "4444.44"]
    
    var curuser : User?
    var history : [Item]?
    
    override func viewDidLoad() {
        print("I got here please dont break")
        curuser = DBHelper.inst.getOneUser(user: DBHelper.inst.getCurrentUser())
        history = curuser!.history?.allObjects as! [Item]
        
        super.viewDidLoad()

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(history!.count == 0){
            return 1
        } else {
            return history!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(history!.count == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ViewHistoryCell
            cell.ItemName.text = "No Item History"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ViewHistoryCell
            cell.ItemName.text = history![indexPath.row].name
            cell.ItemPrice.text = String(history![indexPath.row].price)
            cell.ViewHistoryImg.image = UIImage(named: history![indexPath.row].image!)
        
        return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(history?.count != 0){
            DBHelper.inst.holdCurrentItem(name: history![indexPath.item].name!)
            let Bienvenue = storyboard?.instantiateViewController(withIdentifier: "ItemBoard") as! ItemCtrl
            present(Bienvenue, animated: true, completion: nil)
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    

    
    
 
    


}
