//
//  NetBankingPage.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/2/21.
//

import UIKit

class NetBankingPage: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var BankTxt: UITextField!
    
    
    let paymentOptions = ["Bank Of America", "Chase", "Citi", "Wells Fargo", ""]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        BankTxt.inputView = pickerView
        BankTxt.textAlignment = .center
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
    }

    
    @IBAction func SelectBttn(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Bank Selection", message: "You Selected \(String(describing: BankTxt.text))", preferredStyle: UIAlertController.Style.alert)
        let ContinueAction = UIAlertAction(title: "Continue", style: .default){
            (action: UIAlertAction!) in
            print("Button Clicked")}
        
        if (paymentOptions.contains(BankTxt.text!)){
            
            print("working")
            alertController.addAction(ContinueAction)
            
        }
        
    }
    
    

}
