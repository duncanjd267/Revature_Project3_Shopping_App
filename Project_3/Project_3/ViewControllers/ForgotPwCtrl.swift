//
//  ForgotPwCtrl.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/3/21.
//

import UIKit

class ForgotPwCtrl: UIViewController
{
	@IBOutlet weak var EmailField: UITextField!
	
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
		var address: String?
		
		if let thing = EmailField!.text, thing.isEmpty
		{
			return // Can't do anything with an empty field
		}
		else
		{
			address = EmailField!.text
		}
		
		
	}
	
}
