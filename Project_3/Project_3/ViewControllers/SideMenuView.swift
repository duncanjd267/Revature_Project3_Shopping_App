//
//  SideMenuView.swift
//  Project_3
//
//  Created by Kangseok Lee on 5/30/21.
//

import UIKit


protocol SideMenuViewDelegate {
    func hideSideMenu()
}

class SideMenuView: UIViewController {

    var delegate : SideMenuViewDelegate?
    
    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var profilePictureImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func ViewHistory(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "ViewHistory") as! ViewHistoryPage
        present(vc, animated: true)
        
    }
    
    @IBAction func WishList(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "WishList") as! WishListViewController
        present(vc, animated: true)
        
    }
    
    @IBAction func Logout(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "LogInPage") as! LoginCtrl
        present(vc, animated: true)
        
    }
    
    

}
