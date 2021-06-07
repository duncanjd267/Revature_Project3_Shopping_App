//
//  BrandPageView.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/1/21.
//

import UIKit

class BrandPageView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var brand = DBHelper.inst.getItemsBrand(name: DBHelper.inst.getCurrentBrand())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return brand.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BrandPageTableCell
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        print(String(indexPath.row))
        cell.BrandName.text = brand[indexPath.row].name
        cell.BrandDP.text = brand[indexPath.row].descript
        cell.BrandImg.image = UIImage(named: brand[indexPath.row].image!)
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DBHelper.inst.holdCurrentItem(name: brand[indexPath.item].name!)
        let Bienvenue = storyboard?.instantiateViewController(withIdentifier: "ItemBoard") as! ItemCtrl
        present(Bienvenue, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    
    
}


