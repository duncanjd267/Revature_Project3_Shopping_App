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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
