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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ViewHistoryCell
        cell.ItemName.text = testLabel[indexPath.row]
        cell.ItemPrice.text = String(testPrice[indexPath.row])
        cell.ViewHistoryImg.image = UIImage(named: testImg[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let Bienvenue = storyboard?.instantiateViewController(withIdentifier: "ItemBoard") as! ItemCtrl
        present(Bienvenue, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    

    
    
 
    


}
