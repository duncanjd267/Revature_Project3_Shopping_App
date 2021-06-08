//
//  ViewHistoryPage.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/2/21.
//

import UIKit

class ViewHistoryPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //    var testImg = ["AdidasLogo", "AppleLogo", "GucciLogo"]
    //    var testLabel = ["Adidas Shoes", "iphone", "Gucci Bag"]
    //    var testPrice = ["0.00", "12.11", "4444.44"]
    
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
            cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
            cell.ItemName.text = history![indexPath.row].name
            cell.ItemPrice.text = "$" + String(history![indexPath.row].price)
            cell.ViewHistoryImg.image = UIImage(named: history![indexPath.row].image!)
            
            switch indexPath.item{
            case 0:
                cell.cellView.backgroundColor = UIColor(red: 248/255.0, green: 220/250.0, blue: 220/250.0, alpha: 0.8)
            case 1:
                cell.cellView.backgroundColor = UIColor(red: 240/255.0, green: 244/250.0, blue: 233/250.0, alpha: 0.8)
            case 2:
                cell.cellView.backgroundColor = UIColor(red: 248/255.0, green: 220/250.0, blue: 220/250.0, alpha: 0.8)
            case 3:
                cell.cellView.backgroundColor = UIColor(red: 240/255.0, green: 244/250.0, blue: 233/250.0, alpha: 0.8)
            case 4:
                cell.cellView.backgroundColor = UIColor(red: 248/255.0, green: 220/250.0, blue: 220/250.0, alpha: 0.8)
            case 5:
                cell.cellView.backgroundColor = UIColor(red: 240/255.0, green: 244/250.0, blue: 233/250.0, alpha: 0.8)
            case 6:
                cell.cellView.backgroundColor = UIColor(red: 248/255.0, green: 220/250.0, blue: 220/250.0, alpha: 0.8)
                
            default:
                print("")
            }
            
            
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(history?.count != 0){
            DBHelper.inst.holdCurrentItem(name: history![indexPath.item].name!)
            let vc = storyboard?.instantiateViewController(identifier: "ItemBoard") as! ItemCtrl
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
//    @IBAction func back(_ sender: Any) {
//
//        let tabViewController =
//        storyboard?.instantiateViewController(withIdentifier: "TabViewControllerUser")
//        view.window?.rootViewController = tabViewController
//        view.window?.makeKeyAndVisible()
//
//    }
    
    
    
}
