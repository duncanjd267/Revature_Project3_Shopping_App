//
//  ItemCtrl.swift
//  Project_3
//
//  Created by admin on 5/24/21.
//

import UIKit

class ItemCtrl: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var ItemPageCell: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    var contentImg = ["SAMSUNG", "HOMPOW", "NETGEAR"]
    
    override func viewDidLoad()
    {
        
        
        super.viewDidLoad()
        name.text = DBHelper.inst.getCurrentItem()
        pageView.numberOfPages = contentImg.count
        pageView.currentPage = 0
        

    }
    
    var item : Item?
    
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
        return contentImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let ItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCtrlCell
        ItemCell.ItemImg.image = UIImage(named: contentImg[indexPath.row])
        
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
        
}
    
    





