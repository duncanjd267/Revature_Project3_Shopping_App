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
	
    override func viewDidLoad()
	{
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
			return // Can't do anything with an empty field
		}
		
		phoneN = PhoneField!.text
		let result = DBHelper.inst.PwordRecover(Pnum: phoneN!)
		
	}
	
}
