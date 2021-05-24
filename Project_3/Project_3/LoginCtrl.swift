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
		var passN = PassField.text
		
		
	}
	
	override func viewDidLoad()
	{
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
