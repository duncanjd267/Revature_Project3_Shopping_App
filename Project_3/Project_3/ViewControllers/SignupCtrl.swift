//
//  SignupCtrl.swift
//  Project_3
//
//  Created by admin on 5/27/21.
//

import UIKit

class SignupCtrl: UIViewController
{
	@IBOutlet weak var UsrField: UITextField!
	@IBOutlet weak var PassField: UITextField!
	@IBOutlet weak var TeleField: UITextField!
    @IBOutlet weak var SignUp: UIButton!
    
	override func viewDidLoad()
	{
		super.viewDidLoad()
        
        let UserImage = UIImage(named: "UserIcon_txt")
        addLeftImageTo(txtField: UsrField, andImage: UserImage!)
        let PasswordImage = UIImage(named: "Password_txt")
        addLeftImageTo(txtField: PassField, andImage: PasswordImage!)
        let PhoneImage = UIImage(named: "PhoneIcon_txt")
        addLeftImageTo(txtField: TeleField, andImage: PasswordImage!)
        UsrField.TextBoxDesign()
        PassField.TextBoxDesign()
        TeleField.TextBoxDesign()
        SignUp.BttnDesign()

	}
    
    func addLeftImageTo(txtField: UITextField, andImage img:UIImage){
        
        let leftImageView = UIImageView(frame: CGRect(x:0.0, y:0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
        
        
    }
	
	@IBAction func Confirm(_ sender: UIButton)
	{
        
		let existing = DBHelper.inst.getUsers()
		let usrN = UsrField.text!
        
        let MovePage = UIAlertController(title: "Success", message: "You Successfully Signed Up", preferredStyle: UIAlertController.Style.alert)
        let UsernameTaken = UIAlertController(title: "Invalid Information", message: "User name already exist. Please try again", preferredStyle: UIAlertController.Style.alert)
        let EmptyTxt = UIAlertController(title: "Invalid Information", message: "Please Enter Valid Information", preferredStyle: UIAlertController.Style.alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default){
            (action: UIAlertAction!) in
            print("")}
        
		if usrN.isEmpty
		{ // If they didn't enter a username why keep going?
            
            EmptyTxt.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            self.present(EmptyTxt, animated: true, completion: nil)
            UsrField.text = ""
            PassField.text = ""
            TeleField.text = ""
			print("Username empty.")
			return
		}
		
		for person in existing
		{ // Checking if the name is taken
			if person.username! == usrN
			{
                UsernameTaken.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
                self.present(UsernameTaken, animated: true, completion: nil)
                UsrField.text = ""
                PassField.text = ""
                TeleField.text = ""
				print("Username taken. try again.")
				return
			}
		}
		
		let pasW = PassField.text!
		
		if pasW.isEmpty
		{ // Can't have a nil password
            EmptyTxt.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            self.present(EmptyTxt, animated: true, completion: nil)
            UsrField.text = ""
            PassField.text = ""
            TeleField.text = ""
			print("Password empty.")
			return
		}
		
		var phone = TeleField.text!
		
		if phone.isEmpty
		{ // Need a phone number
            
            EmptyTxt.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            self.present(EmptyTxt, animated: true, completion: nil)
            UsrField.text = ""
            PassField.text = ""
            TeleField.text = ""
		}
		
		let UsrInfo = ["username": usrN, "password": pasW, "phone": phone]
		
		print("Calling addUser.")
		DBHelper.inst.addUser(object: UsrInfo)

        MovePage.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        self.present(MovePage, animated: true, completion: nil)
        UsrField.text = ""
        PassField.text = ""
        TeleField.text = ""
        
//		let Bienvenue = storyboard?.instantiateViewController(withIdentifier: "LogInPage") as! LoginCtrl
//
//		present(Bienvenue, animated: true, completion: nil)
	}
	
	@IBAction func SignIn(_ sender: UIButton)
	{
		let back = storyboard?.instantiateViewController(withIdentifier: "LogInPage") as! LoginCtrl
		
		present(back, animated: true, completion: nil)
	}
	
}
