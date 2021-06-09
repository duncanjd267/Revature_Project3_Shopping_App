//
//  CODpage.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/2/21.
//

import UIKit

class CODpage: UIViewController {

    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var nameTxt2: UITextField!
    @IBOutlet weak var addressTxt: UITextField!
    @IBOutlet weak var addressTxt2: UITextField!
    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var postcodeTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func submit(_ sender: Any) {
        
        if (nameTxt.text == "" || nameTxt2.text == "" || addressTxt.text == "" || addressTxt2.text == "" || cityTxt.text == "" || postcodeTxt.text == "") {
            
            let Invalid = UIAlertController(title: "Invalid Information", message: "Please Enter Valid Information To Proceed", preferredStyle: UIAlertController.Style.alert)
            Invalid.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(Invalid, animated: true, completion: nil)
            
        }
        else {
            DBHelper.inst.updateCartPurchased(name: DBHelper.inst.getCurrentUser())
            let SubmitComments = UIAlertController(title: "Submit Confirmation", message: "Your Payment is Successfully Processed", preferredStyle: UIAlertController.Style.alert)
            SubmitComments.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            self.present(SubmitComments, animated: true, completion: nil)
        }

    }
}
