//
//  WelcomeView.swift
//  Project_3
//
//  Created by admin on 5/25/21.
//

import UIKit

class WelcomeView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    @IBOutlet weak var Recommandations: UICollectionView!
    @IBOutlet weak var Deals: UICollectionView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //var RecommandedImage = ["Adorrgon", "AICOK", "Amazon", "Dewalt", "Duracell", "Fairywill", "Fosil", "Newman's", "Samsung_Laptop", "Skechers"]
    
    var itemList = DBHelper.inst.getItems()
    
    //var ItemName = ["Item1", "Item2", "Item3", "Item4", "Item5", "Item6", "Item7", "Item8", "Item9", "Item10"]
    
    //var DealsImage = ["BLINKHOMESECURITY", "DXLOVER", "HOMPOW", "MADAXY", "NETGEAR", "SAMSUNG", "Solimo", "TOMETIC", "TRYVAT", "Yeedi"]
    
   // var ItemName2 = ["Item1", "Item2", "Item3", "Item4", "Item5", "Item6", "Item7", "Item8", "Item9", "Item10"]
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.Recommandations{
            return itemList.count
        }
        else{
            return itemList.count
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
    
    
}
