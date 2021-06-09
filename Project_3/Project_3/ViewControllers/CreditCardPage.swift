//
//  CreditCardPage.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/2/21.
//

import UIKit
import MFCard

class CreditCardPage: UIViewController, MFCardDelegate {
   
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var nameTxt2: UITextField!
    @IBOutlet weak var addressTxt: UITextField!
    @IBOutlet weak var addressTxt2: UITextField!
    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var postcodeTxt: UITextField!
    
    func cardDoneButtonClicked(_ card: Card?, error: String?) {
        if error == nil{
            print(card!)
        }else{
            print(error!)
        }
    }
    
    func cardTypeDidIdentify(_ cardType: String) {
        
        
    }
    
    
    func cardDidClose() {
        
    }
    
    
    
    override func viewDidLoad() {
        
        var myCard : MFCardView
        myCard  = MFCardView(withViewController: self)
        myCard.delegate = self
        myCard.autoDismiss = true
        myCard.toast = true
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
