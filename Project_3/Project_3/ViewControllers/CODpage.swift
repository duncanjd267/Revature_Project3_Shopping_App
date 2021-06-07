//
//  CODpage.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/2/21.
//

import UIKit

class CODpage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func submit(_ sender: Any) {
        DBHelper.inst.updateCartPurchased(name: DBHelper.inst.getCurrentUser())
    }
}
