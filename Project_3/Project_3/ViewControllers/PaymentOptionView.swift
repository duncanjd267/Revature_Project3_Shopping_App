//
//  PaymentOptionView.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/2/21.
//

import UIKit

class PaymentOptionView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var PaymentTxt: UITextField!
    
    let paymentOptions = ["--Select A Payment Option--","Credit Card", "Net Banking", "Pay on Delivery"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        PaymentTxt.inputView = pickerView
        PaymentTxt.textAlignment = .center
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
        PaymentTxt.text = paymentOptions[row]
        PaymentTxt.resignFirstResponder()
        
        if PaymentTxt.text == "-- Select A Payment Option --"{
            PaymentTxt.text = ""
        }
    }
    
    @IBAction func CheckoutBttn(_ sender: Any) {
        

        if PaymentTxt.text == "Credit Card"{
            let vc = storyboard?.instantiateViewController(identifier: "CreditVC") as! CreditCardPage
            present(vc, animated: true)
        }
        else if PaymentTxt.text == "Net Banking"{
            let vc = storyboard?.instantiateViewController(identifier: "NetVC") as! NetBankingPage
            present(vc, animated: true)
        }else{
            let vc = storyboard?.instantiateViewController(identifier: "CODVC") as! CODpage
            present(vc, animated: true)
        }
        
    }
    
}
