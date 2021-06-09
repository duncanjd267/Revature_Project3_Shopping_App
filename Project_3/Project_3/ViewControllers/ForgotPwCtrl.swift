//
//  ForgotPwCtrl.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/3/21.
//

import UIKit

class ForgotPwCtrl: UIViewController
{
    @IBOutlet weak var PhoneField: UITextField!
    @IBOutlet weak var SubmitBttn: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let PhoneImage = UIImage(named: "PhoneIcon_txt")
        addLeftImageTo(txtField: PhoneField, andImage: PhoneImage!)
        PhoneField.TextBoxDesign()
        SubmitBttn.BttnDesign()
    }
    
    
    func addLeftImageTo(txtField: UITextField, andImage img:UIImage){
        
        let leftImageView = UIImageView(frame: CGRect(x:0.0, y:0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
        
        
    }
    
    @IBAction func SignIn(_ sender: Any)
    {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "LogInPage") as! LoginCtrl
        present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func Recover(_ sender: UIButton)
    {
        var phoneN: String?
        
        if let thing = PhoneField!.text, thing.isEmpty
        {
            let Invalid = UIAlertController(title: "Invalid Information", message: "Please Enter Valid Information To Proceed", preferredStyle: UIAlertController.Style.alert)
            Invalid.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(Invalid, animated: true, completion: nil)
            
            return // Can't do anything with an empty field
        }
        
        phoneN = PhoneField!.text
        let result = DBHelper.inst.PwordRecover(Pnum: phoneN!)
        
    }
    
}
