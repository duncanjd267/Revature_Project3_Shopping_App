//
//  ForgotPwCtrl.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/3/21.
//

import UIKit

class ForgotPwCtrl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignIn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "LogInPage") as! LoginCtrl
        present(vc, animated: true, completion: nil)
        
    }
    

}
