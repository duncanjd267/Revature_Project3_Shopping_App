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
    
    var RecommandedImage = ["Adorrgon", "AICOK", "Amazon", "Dewalt", "Duracell", "Fairywill", "Fosil", "Newman's", "Samsung_Laptop", "Skechers"]
    
    var ItemName = ["Item1", "Item2", "Item3", "Item4", "Item5", "Item6", "Item7", "Item8", "Item9", "Item10"]
    
    var DealsImage = ["BLINKHOMESECURITY", "DXLOVER", "HOMPOW", "MADAXY", "NETGEAR", "SAMSUNG", "Solimo", "TOMETIC", "TRYVAT", "Yeedi"]
    
    var ItemName2 = ["Item1", "Item2", "Item3", "Item4", "Item5", "Item6", "Item7", "Item8", "Item9", "Item10"]
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.Recommandations{
            return RecommandedImage.count
        }
        else{
            return DealsImage.count
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.Recommandations{
            
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! WelcomeViewCell
            cell1.ReImage.image = UIImage(named: RecommandedImage[indexPath.row])
            cell1.ReText.text = ItemName[indexPath.row]
            return cell1
            
        }
        else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! WelcomeViewCell
            cell2.DealsImg.image = UIImage(named: DealsImage[indexPath.row])
            cell2.DealsText.text = ItemName2[indexPath.row]
            return cell2
        }
        
    }
    
    
}
