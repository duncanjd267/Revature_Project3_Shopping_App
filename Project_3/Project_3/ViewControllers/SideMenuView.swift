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
    @IBAction func clickOnButton(_ sender: Any) {
        
        self.delegate?.hideSideMenu()
        
    }
    
    


}
