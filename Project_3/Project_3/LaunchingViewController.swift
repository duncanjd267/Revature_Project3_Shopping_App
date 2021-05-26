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
        dic = ["name": "Networking", "description": "Very nice network", "category": "Tech", "image": "NETGEAR"]
        DBHelper.inst.addItem(object: dic, price: 49.99)
        dic = ["name": "Samsung Ear Buds", "description": "Very nice Ear Buds", "category": "Tech", "image": "SAMSUNG"]
        DBHelper.inst.addItem(object: dic, price: 69.99)
        dic = ["name": "Projector", "description": "Very nice Projector", "category": "Tech", "image": "HOMPOW"]
        DBHelper.inst.addItem(object: dic, price: 39.99)
        dic = ["name": "Audio System", "description": "Very nice Audio", "category": "Tech", "image": "Yeedi"]
        DBHelper.inst.addItem(object: dic, price: 29.99)
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
