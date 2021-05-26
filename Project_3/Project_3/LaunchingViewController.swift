//
//  LaunchingViewController.swift
//  Project_3
//
//  Created by admin on 5/26/21.
//

import UIKit

class LaunchingViewController: UIViewController {
    
    var dic : [String:String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func populate(_ sender: Any) {
        //addidas
        dic = ["name": "Black Addidas shoes", "description": "Black shoes perfect for running and outdoor activities", "category": "Addidas", "image": "BAddidas1", "image2" : "BAddidas2", "image3" : "BAddidas3"]
        DBHelper.inst.addItem(object: dic, price: 39.99)
        dic = ["name": "Blue Addidas shoes", "description": "Blue shoes perfect for running and outdoor activities, lifting as well", "category": "Addidas", "image": "BlAddidas1", "image2" : "BlAddidas2", "image3" : "BlAddidas3"]
        DBHelper.inst.addItem(object: dic, price: 29.99)
        dic = ["name": "Camo Addidas shoes", "description": "Camo shoes perfect for running and outdoor activities", "category": "Addidas", "image": "CAddidas1", "image2" : "CAddidas2", "image3" : "CAddidas3"]
        DBHelper.inst.addItem(object: dic, price: 59.99)
        dic = ["name": "Red Addidas shoes", "description": "Red shoes perfect for running and outdoor activities, lifting as well", "category": "Addidas", "image": "RAddidas1", "image2" : "RAddidas2", "image3" : "RAddidas3"]
        DBHelper.inst.addItem(object: dic, price: 19.99)
        dic = ["name": "White Addidas shoes", "description": "White shoes perfect for running and outdoor activities, lifting as well", "category": "Addidas", "image": "WAddidas1", "image2" : "WAddidas2", "image3" : "WAddidas3"]
        DBHelper.inst.addItem(object: dic, price: 79.99)
        
        //Apple
        dic = ["name": "Apple iPhone7", "description": "Apple iPhone perfect for the frugal shopper", "category": "Apple", "image": "iPhone7(1)", "image2" : "iPhone7(2)", "image3" : "iPhone7(3)"]
        DBHelper.inst.addItem(object: dic, price: 399.99)
        dic = ["name": "Apple iPhone11", "description": "Apple iPhone perfect for the super frugal shopper", "category": "Apple", "image": "iPhone11(1)", "image2" : "iPhone11(2)", "image3" : "iPhone11(3)"]
        DBHelper.inst.addItem(object: dic, price: 299.99)
        dic = ["name": "Apple iPhoneSE", "description": "Apple iPhone that is reliable and perfect for buisness", "category": "Apple", "image": "iPhoneSE(1)", "image2" : "iPhoneSE(2)", "image3" : "iPhoneSE(3)"]
        DBHelper.inst.addItem(object: dic, price: 599.99)
        dic = ["name": "Apple iPhone12", "description": "Apple iPhone that is reliable and perfect for buisness", "category": "Apple", "image": "iPhone12(1)", "image2" : "iPhone12(2)", "image3" : "iPhone12(3)"]
        DBHelper.inst.addItem(object: dic, price: 199.99)
        dic = ["name": "Apple iPhoneXS", "description": "Apple iPhone that is reliable and perfect for buisness", "category": "Apple", "image": "iPhoneXS(1)", "image2" : "iPhoneXS(2)", "image3" : "iPhoneXS(3)"]
        DBHelper.inst.addItem(object: dic, price: 799.99)
        
        //Gucci
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
