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
	
	override func viewDidLoad()
	{
		super.viewDidLoad()

	}
	
	@IBAction func Confirm(_ sender: UIButton)
	{
		let existing = DBHelper.inst.getUsers()
		let usrN = UsrField.text!
		
		if usrN.isEmpty
		{ // If they didn't enter a username why keep going?
			print("Username empty.")
			return
		}
		
		for person in existing
		{ // Checking if the name is taken
			if person.username! == usrN
			{
				print("Username taken. try again.")
				return
			}
		}
		
		let pasW = PassField.text!
		
		if pasW.isEmpty
		{ // Can't have a nil password
			print("Password empty.")
			return
		}
		
		var phone = TeleField.text!
		
		if phone.isEmpty
		{ // Need a phone number
			phone = " "
		}
		
		let UsrInfo = ["username": usrN, "password": pasW, "phone": phone]
		
		print("Calling addUser.")
		DBHelper.inst.addUser(object: UsrInfo)
		
		let Bienvenue = storyboard?.instantiateViewController(withIdentifier: "LogIn") as! LoginCtrl
		
		present(Bienvenue, animated: true, completion: nil)
	}
	
	@IBAction func SignIn(_ sender: UIButton)
	{
		let back = storyboard?.instantiateViewController(withIdentifier: "LogIn") as! LoginCtrl
		
		present(back, animated: true, completion: nil)
	}
	
}
