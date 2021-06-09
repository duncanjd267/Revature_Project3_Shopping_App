//
//  CommentViewController.swift
//  Project_3
//
//  Created by admin on 5/28/21.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var commentTxt: UITextField!
    
    @IBOutlet weak var comment: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: Any) {
        
        let SubmitComments = UIAlertController(title: "Submit Review", message: "Your Review is Now Being Submitted", preferredStyle: UIAlertController.Style.alert)
        SubmitComments.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        self.present(SubmitComments, animated: true, completion: nil)
        
        var cur = DBHelper.inst.getOneItem(item: DBHelper.inst.getCurrentItem())
        DBHelper.inst.addComment(object: comment.text!)
        var curcom = DBHelper.inst.getOneComment(user: comment.text!)
        curcom.comment = comment.text!
        DBHelper.inst.updateComments(name: cur.name!, comment: curcom)
        
    }
    
    @IBAction func Cancel(_ sender: Any) {
        
        let CancelComments = UIAlertController(title: "Cancel Review", message: "Your Review is Now Being Cancelled", preferredStyle: UIAlertController.Style.alert)
        CancelComments.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(CancelComments, animated: true, completion: nil)
        
        commentTxt.text = ""
        
    }
    @IBAction func back(_ sender: Any) {
        
        let tabViewController =
            storyboard?.instantiateViewController(withIdentifier: "TabViewControllerUser")
        view.window?.rootViewController = tabViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}
