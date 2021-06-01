//
//  WelcomeView.swift
//  Project_3
//
//  Created by admin on 5/25/21.
//

import UIKit

class WelcomeView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SideMenuViewDelegate
{
    
    
    
    @IBOutlet weak var Recommandations: UICollectionView!
    @IBOutlet weak var Deals: UICollectionView!
    @IBOutlet weak var SideMenuBackView: UIView!
    @IBOutlet weak var SideMenuView: UIView!
    @IBOutlet weak var leadingContriantsForSideMenu: NSLayoutConstraint!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var NikeBttn: UIButton!
    @IBOutlet weak var GucciBttn: UIButton!
    @IBOutlet weak var HpBttn: UIButton!
    @IBOutlet weak var AppleBttn: UIButton!
    @IBOutlet weak var PsBttn: UIButton!
    @IBOutlet weak var AdidasBttn: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NikeBttn.BttnDesign()
        GucciBttn.BttnDesign()
        HpBttn.BttnDesign()
        AppleBttn.BttnDesign()
        PsBttn.BttnDesign()
        AdidasBttn.BttnDesign()
        
        self.ScrollView.delegate = self
        self.SideMenuView.isHidden = true
        self.SideMenuBackView.isHidden = true
    
    
    }
    
    var sidemenuViewController:SideMenuView?
    var itemList = DBHelper.inst.getItems()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sidemenuSegue"){
            if let controller = segue.destination as? SideMenuView{
                self.sidemenuViewController = controller
                self.sidemenuViewController?.delegate = self
            }
        }
    }
    
    
    @IBAction func tappedOnBackView(_ sender: Any) {
        self.hideSideMenuView()
    }
    
    
    func hideSideMenu() {
        self.hideSideMenuView()
    }
    
    private func hideSideMenuView(){
        
        UIView.animate(withDuration: 0.1, animations: { self.leadingContriantsForSideMenu.constant = 10
        self.view.layoutIfNeeded()}){ (status) in UIView.animate(withDuration: 0.1, animations: { self.leadingContriantsForSideMenu.constant = -290
            self.view.layoutIfNeeded()}) {(status) in
            self.SideMenuBackView.isHidden = true
            self.SideMenuView.isHidden = true
            self.ScrollView.isScrollEnabled = true
            
            }
                                                            
        }
        
    }
    
    @IBAction func SideMenuBttn(_ sender: Any) {
        
        UIView.animate(withDuration: 0.1, animations: { self.leadingContriantsForSideMenu.constant = 10
        self.view.layoutIfNeeded()}){ (status) in UIView.animate(withDuration: 0.1, animations: { self.leadingContriantsForSideMenu.constant = -10
            self.view.layoutIfNeeded()}) {(status) in
            self.SideMenuBackView.isHidden = false
            self.SideMenuView.isHidden = false
            self.ScrollView.isScrollEnabled = false
            
            }
                                                            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.Recommandations{
            return itemList.count
        }
        else{
            return 9
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.Recommandations{
            DBHelper.inst.holdCurrentItem(name: itemList[indexPath.item].name!)
            let Bienvenue = storyboard?.instantiateViewController(withIdentifier: "ItemBoard") as! ItemCtrl
            present(Bienvenue, animated: true, completion: nil)
            
        }
        else {
            DBHelper.inst.holdCurrentItem(name: itemList[indexPath.item].name!)
            let Bienvenue = storyboard?.instantiateViewController(withIdentifier: "ItemBoard") as! ItemCtrl
            present(Bienvenue, animated: true, completion: nil)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.Recommandations{
            print("Doing Recommendations")
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! WelcomeViewCell
            cell1.ReImage.image = UIImage(named: itemList[indexPath.item].image!)
            cell1.ReText.text = itemList[indexPath.item].name!
            return cell1
            
        }
        else {
            print("Doing Deals")
            print(itemList[indexPath.item].image!)
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! WelcomeViewCell
            cell2.DealsImg.image = UIImage(named: itemList[indexPath.item].image!)
            cell2.DealsText.text = itemList[indexPath.item].name!
            return cell2
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.Deals {
            return CGSize(width: 120, height: 120)
        }
        else {
            return CGSize()
        }
    }
    
}





//var RecommandedImage = ["Adorrgon", "AICOK", "Amazon", "Dewalt", "Duracell", "Fairywill", "Fosil", "Newman's", "Samsung_Laptop", "Skechers"]
//var ItemName = ["Item1", "Item2", "Item3", "Item4", "Item5", "Item6", "Item7", "Item8", "Item9", "Item10"]
//var DealsImage = ["BLINKHOMESECURITY", "DXLOVER", "HOMPOW", "MADAXY", "NETGEAR", "SAMSUNG", "Solimo", "TOMETIC", "TRYVAT", "Yeedi"]
// var ItemName2 = ["Item1", "Item2", "Item3", "Item4", "Item5", "Item6", "Item7", "Item8", "Item9", "Item10"]
