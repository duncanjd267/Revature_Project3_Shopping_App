//
//  BrandPageView.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/1/21.
//

import UIKit

class BrandPageView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var testImg = ["AdidasLogo", "AppleLogo", "GucciLogo"]
    var testLabel = ["Adidas Shoes", "iphone", "Gucci Bag"]
    var testPrice = ["0.00", "12.11", "4444.44"]
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
        cell.BrandName.text = brand[indexPath.row].name
        cell.BrandPrice.text = String(brand[indexPath.row].price)
        cell.BrandImg.image = UIImage(named: brand[indexPath.row].image!)
        
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
