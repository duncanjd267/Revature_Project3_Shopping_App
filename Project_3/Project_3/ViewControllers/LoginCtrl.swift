//
//  LoginCtrl.swift
//  Project_3
//
//  Created by admin on 5/24/21.
//

import UIKit

class LoginCtrl: UIViewController
{

	@IBOutlet weak var UserField: UITextField!
	@IBOutlet weak var PassField: UITextField!
    @IBOutlet weak var LogInBttn: UIButton!
    @IBOutlet weak var ForgotBttn: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let UserImage = UIImage(named: "UserIcon_txt")
        addLeftImageTo(txtField: UserField, andImage: UserImage!)
        let PasswordImage = UIImage(named: "Password_txt")
        addLeftImageTo(txtField: PassField, andImage: PasswordImage!)
        UserField.TextBoxDesign()
        PassField.TextBoxDesign()
        LogInBttn.BttnDesign()
        ForgotBttn.BttnDesign()
    }
    
    func addLeftImageTo(txtField: UITextField, andImage img:UIImage){
        
        let leftImageView = UIImageView(frame: CGRect(x:0.0, y:0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
        
        
    }
	
	@IBAction func LogButton(_ sender: UIButton)
	{
		let usrN = UserField.text
		let passW = PassField.text
		
		if let emp = UserField.text, emp.isEmpty
		{ // no point in continuing without a username
			return
		}
		
		
		let Usr = DBHelper.inst.getOneUser(user: usrN!)
		
		if let emp = PassField.text, emp.isEmpty
		{ // no point in continuing without the password either
			return
		}
		
		let passAct = Usr.password
		
		if passW == passAct
		{
            DBHelper.inst.holdCurrentUser(name: Usr.username!)
			// Verification succeeds
            let tabViewController =
                storyboard?.instantiateViewController(withIdentifier: "TabViewControllerUser")
            view.window?.rootViewController = tabViewController
            view.window?.makeKeyAndVisible()
		}
		else
		{
            let Invalid = UIAlertController(title: "Invalid Information", message: "Please Enter Valid Information To Proceed", preferredStyle: UIAlertController.Style.alert)
            Invalid.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(Invalid, animated: true, completion: nil)
			print("User verification failed")
			print("password entered: ",String(passW!))
			return
		}
	}
	
    @IBAction func ForgotPw(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPW") as! ForgotPwCtrl
        present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func SignUp(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUp") as! SignupCtrl
        present(vc, animated: true, completion: nil)
        
    }
    
    

}
