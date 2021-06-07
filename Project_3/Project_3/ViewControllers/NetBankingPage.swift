//
//  NetBankingPage.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/2/21.
//

import UIKit

class NetBankingPage: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var BankTxt: UITextField!
    @IBOutlet weak var BankImg: UIImageView!
    @IBOutlet weak var BankView: UIView!
    @IBOutlet weak var BankLB: UILabel!
    
    
    let paymentOptions = ["--Select A Bank--", "Bank Of America", "Chase Bank", "Citi Bank", "Wells Fargo"]
    
    var pickerView = UIPickerView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        BankTxt.inputView = pickerView
        BankTxt.textAlignment = .center
        
        BankLB.isHidden = true
        BankImg.isHidden = true
        BankView.isHidden = true
        BankView.layer.shadowRadius = 10
        BankView.layer.shadowOpacity = 0.5
        BankView.layer.shadowOffset = CGSize(width: 5, height: 10)
        BankView.layer.cornerRadius = BankView.frame.height / 2
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return paymentOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return paymentOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        BankTxt.text = paymentOptions[row]
        BankTxt.resignFirstResponder()
        
        if (BankTxt.text == "-- Select Bank --") {
            
            BankLB.isHidden = true
            BankImg.isHidden = true
            BankView.isHidden = true
            BankTxt.text = ""
        }
        
        if (BankTxt.text == "Bank Of America"){
            
            BankLB.isHidden = false
            BankImg.isHidden = false
            BankView.isHidden = false
            BankImg.image = UIImage(named: "BOAIcon")
            BankLB.text = "Bank Of America"
        }
        else if (BankTxt.text == "Chase Bank"){
            
            BankLB.isHidden = false
            BankImg.isHidden = false
            BankView.isHidden = false
            BankImg.image = UIImage(named: "ChaseIcon")
            BankLB.text = "Chase Bank"
        }
        else if (BankTxt.text == "Citi Bank"){
            
            BankLB.isHidden = false
            BankImg.isHidden = false
            BankView.isHidden = false
            BankImg.image = UIImage(named: "CitiIcon")
            BankLB.text = "Citi Bank"
        }
        else if (BankTxt.text == "Wells Fargo"){
            
            BankLB.isHidden = false
            BankImg.isHidden = false
            BankView.isHidden = false
            BankImg.image = UIImage(named: "WellsFargoIcon")
            BankLB.text = "Wells Fargo"
        }
    }

    
    @IBAction func SelectBttn(_ sender: Any) {
        
        let Selected = UIAlertController(title: "Bank Selection", message: "You Selected \(BankTxt.text!) For Your Payment Option", preferredStyle: UIAlertController.Style.alert)
        
        if (paymentOptions.contains(BankTxt.text!)){
            
            Selected.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            self.present(Selected, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func submit(_ sender: Any) {
        DBHelper.inst.updateCartPurchased(name: DBHelper.inst.getCurrentUser())
        
    }
    
    
    

}
