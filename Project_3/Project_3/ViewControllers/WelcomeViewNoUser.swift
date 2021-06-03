//
//  WelcomeViewNoUser.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/1/21.
//

import UIKit

class WelcomeViewNoUser: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var DealsCell: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    var itemList = DBHelper.inst.getItems()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageView.numberOfPages = itemList.count
        pageView.currentPage = 0
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WelcomeViewNotUserCell
        cell.DealsImg.image = UIImage(named: itemList[indexPath.item].image!)
        
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let size = DealsCell.frame.size
            return CGSize(width: size.width, height: size.height)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    
        return 0.0
    
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        pageView.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DBHelper.inst.holdCurrentItem(name: itemList[indexPath.item].name!)
        let Bienvenue = storyboard?.instantiateViewController(withIdentifier: "ItemBoard") as! ItemCtrl
        present(Bienvenue, animated: true, completion: nil)

    }
    
    
    //Mark:- Best selling table set up
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! WelcomeViewNotUserTableCell
        
        cell.BestSellingItem.text = itemList[indexPath.row].name!
        cell.BestSellingPrice.text = String(itemList[indexPath.row].price)
        cell.BestSellingImage.image = UIImage(named: itemList[indexPath.row].image!)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DBHelper.inst.holdCurrentItem(name: itemList[indexPath.item].name!)
        let Bienvenue = storyboard?.instantiateViewController(withIdentifier: "ItemBoard") as! ItemCtrl
        present(Bienvenue, animated: true, completion: nil)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150.0
        
    }
    

}
