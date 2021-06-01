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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return testImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BrandPageTableCell
        cell.BrandName.text = testLabel[indexPath.row]
        cell.BrandPrice.text = testPrice[indexPath.row]
        cell.BrandImg.image = UIImage(named: testImg[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }


}
