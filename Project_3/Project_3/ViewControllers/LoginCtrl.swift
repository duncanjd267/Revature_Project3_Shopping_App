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
			// Verification succeeds
			let Bienvenue = storyboard?.instantiateViewController(withIdentifier: "WelcomeLI") as! WelcomeView
			present(Bienvenue, animated: true, completion: nil)
		}
		else
		{
			// Failure
			print("User verification failed")
			print("password entered: ",String(passW!))
			return
		}
	}
	
	
	override func viewDidLoad()
	{
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	
}
