//
//  ItemCtrl.swift
//  Project_3
//
//  Created by admin on 5/24/21.
//

import UIKit

class ItemCtrl: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource
{

    
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var ItemPageCell: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    
    var contentImg : [String]?
    
    var item : Item?
    
    var simBrand : [Item]?
    
    override func viewDidLoad()
    {
        
        var cur = DBHelper.inst.getOneItem(item: DBHelper.inst.getCurrentItem())
        item = cur
        simBrand = DBHelper.inst.getItemsBrand(name: cur.category!)
        var temp = [cur.image!, cur.image2!, cur.image3!]
        contentImg = temp
        super.viewDidLoad()
        name.text = DBHelper.inst.getCurrentItem()
        descr.text = cur.descript!
        pageView.numberOfPages = contentImg!.count
        pageView.currentPage = 0

    }
    
    
    @IBAction func AddCart(_ sender: Any) {
        DBHelper.inst.updateCart(name: DBHelper.inst.getCurrentItem(), item: item!)
    }
    //var counter = 0
    
    //    @objc private func pageViewChanged(_ sender: UIPageControl){
    //
    //        if counter < contentImg.count{
    //            let index = IndexPath.init(item: counter, section: 0)
    //            self.ItemPageCell.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    //            pageView.currentPage = counter
    //            counter += 1
    //        }else{
    //            counter = 0
    //            let index = IndexPath.init(item: counter, section: 0)
    //            self.ItemPageCell.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    //            pageView.currentPage = counter
    //        }
    //
    //    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentImg!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let ItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCtrlCell
        ItemCell.ItemImg.image = UIImage(named: contentImg![indexPath.row])
        
        return ItemCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = ItemPageCell.frame.size
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
    
 //Mark:- Review Tableviews Implementation
    
    
    var reviewsEx = ["good", "bad", "poor"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewsEx.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! ItemCtrlTableCell
        cell.ReviewLB.text = reviewsEx[indexPath.row]
            return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
        
}
    
    





