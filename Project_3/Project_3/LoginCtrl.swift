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
		var usrN = UserField.text
		var passW = PassField.text
		
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
		}
		else
		{
			// Failure
			return
		}
	}
	
	override func viewDidLoad()
	{
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
