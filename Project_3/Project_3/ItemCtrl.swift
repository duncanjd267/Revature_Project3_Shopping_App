//
//  ItemCtrl.swift
//  Project_3
//
//  Created by admin on 5/24/21.
//

import UIKit

class ItemCtrl: UIViewController
{

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descr: UILabel!
    
    var item : Item?
    
    override func viewDidLoad()
	{
        super.viewDidLoad()
        name.text = DBHelper.inst.getCurrentItem()
        //item = DBHelper.inst.getOneItem(item: name.text!)
        //descr.text = item?.descript
        // Do any additional setup after loading the view.
    }
    

}
