//
//  CreditCardPage.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/2/21.
//

import UIKit
import MFCard

class CreditCardPage: UIViewController, MFCardDelegate {
   
    
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
        
        //CardView.isHidden = false
        var myCard : MFCardView
        myCard  = MFCardView(withViewController: self)
        myCard.delegate = self
        myCard.autoDismiss = true
        myCard.toast = true
        //myCard.showCard()
    }
    
    @IBAction func submit(_ sender: Any) {
        DBHelper.inst.updateCartPurchased(name: DBHelper.inst.getCurrentUser())
    }
    
    
}
