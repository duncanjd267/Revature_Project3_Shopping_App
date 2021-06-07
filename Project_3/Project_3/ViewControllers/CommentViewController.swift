//
//  CommentViewController.swift
//  Project_3
//
//  Created by admin on 5/28/21.
//

import UIKit

class CommentViewController: UIViewController {


    @IBOutlet weak var comment: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: Any) {
        var cur = DBHelper.inst.getOneItem(item: DBHelper.inst.getCurrentItem())
        DBHelper.inst.addComment(object: comment.text!)
        var curcom = DBHelper.inst.getOneComment(user: comment.text!)
        curcom.comment = comment.text!
        DBHelper.inst.updateComments(name: cur.name!, comment: curcom)
    }
    
    @IBAction func Cancel(_ sender: Any) {
        
        let tabViewController =
            storyboard?.instantiateViewController(withIdentifier: "TabViewControllerUser")
        view.window?.rootViewController = tabViewController
        view.window?.makeKeyAndVisible()
        
    }
    

}
