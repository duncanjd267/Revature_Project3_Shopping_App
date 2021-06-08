//
//  ItemCtrl.swift
//  Project_3
//
//  Created by admin on 5/24/21.
//

import UIKit

class ItemCtrl: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource
{
    
    
    
    
    @IBOutlet weak var BackBttn: UIButton!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var ItemPageCell: UICollectionView!
    @IBOutlet weak var RelatedItem: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var ItemPrice: UILabel!
    
    
    
    var contentImg : [String]?
    //itemcontroller
    var item : Item?
    
    var simBrand : [Item]?
    
    //Related Items DBHelper needed
    var itemList = DBHelper.inst.getItems()
    
    override func viewDidLoad()
    {
        navigationController?.isNavigationBarHidden = true
        var cur = DBHelper.inst.getOneItem(item: DBHelper.inst.getCurrentItem())
        item = cur
        simBrand = DBHelper.inst.getItemsBrand(name: cur.category!)
        var temp = [cur.image!, cur.image2!, cur.image3!]
        if DBHelper.inst.getCurrentUser() == ""{
            print("No user present")
            BackBttn.isHidden = false
        }
        else{
            var usern = DBHelper.inst.getOneUser(user: DBHelper.inst.getCurrentUser())
            let history = usern.history?.allObjects as! [Item]
            print(history.count)
            if(!history.contains(cur) || history.count == 0){
                DBHelper.inst.updateItemViewed(item: cur.name!)
            }
        }
        contentImg = temp
        super.viewDidLoad()
        name.text = DBHelper.inst.getCurrentItem()
        descr.text = cur.descript!
        ItemPrice.text = "$" + String(cur.price)
        pageView.numberOfPages = contentImg!.count
        pageView.currentPage = 0
        
    }
    
    
    @IBAction func AddCart(_ sender: Any) {
        if DBHelper.inst.getCurrentUser() == ""{
            print("No user, please login")
        }
        else {
            DBHelper.inst.updateCart(name: DBHelper.inst.getCurrentUser(), item: item!)
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.ItemPageCell{
            return contentImg!.count
        }
        
        else {
            return simBrand!.count
        }
        
    }
    
    //Mark:- Recommanded and Deals of the day collection views control
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.ItemPageCell{
            let ItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCtrlCell
            ItemCell.ItemImg.image = UIImage(named: contentImg![indexPath.row])
            
            return ItemCell
        }
        else {
            let ItemCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell2", for: indexPath) as! ItemCtrlCell
            ItemCell2.ItemImg2.image = UIImage(named: simBrand![indexPath.row].image!)
            ItemCell2.ItemName.text = simBrand![indexPath.row].name!
            ItemCell2.ItemPrice.text = "$" + String(simBrand![indexPath.row].price)
            return ItemCell2
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.RelatedItem {
            DBHelper.inst.holdCurrentItem(name: itemList[indexPath.item].name!)
            let vc = storyboard?.instantiateViewController(identifier: "ItemBoard") as! ItemCtrl
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.ItemPageCell{
            
            let size = ItemPageCell.frame.size
            return CGSize(width: size.width, height: size.height)
            
        }
        else {
            let size = RelatedItem.frame.size
            return CGSize(width: size.width, height: size.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == self.ItemPageCell{
            return 0.0
        } else {
            return 10.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == self.ItemPageCell{
            return 0.0
        } else {
            return 10.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        pageView.currentPage = indexPath.row
    }
    
    
    //Mark:- Review Tableviews Implementation
    
    
    var reviewsEx : [Comments]?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if item?.numcom == 0{
            return 0
        } else {
            reviewsEx = item?.tocomment?.allObjects as! [Comments]
            return reviewsEx!.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! ItemCtrlTableCell
        cell.ReviewLB.text = reviewsEx![indexPath.row].comment
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
//    @IBAction func back(_ sender: Any) {
//
//        if DBHelper.inst.getCurrentUser() == ""{
//
//            let Bienvenue = storyboard?.instantiateViewController(withIdentifier: "NoUser") as! WelcomeViewNoUser
//            present(Bienvenue, animated: true, completion: nil)
//
//        } else {
//
//            let tabViewController =
//                storyboard?.instantiateViewController(withIdentifier: "TabViewControllerUser")
//            view.window?.rootViewController = tabViewController
//            view.window?.makeKeyAndVisible()
//
//        }
//    }
    
}







