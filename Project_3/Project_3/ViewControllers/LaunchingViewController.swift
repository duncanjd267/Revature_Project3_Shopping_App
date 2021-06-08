//
//  LaunchingViewController.swift
//  Project_3
//
//  Created by admin on 5/26/21.
//

import UIKit

class LaunchingViewController: UIViewController {
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var GuestBttn: UIButton!
    @IBOutlet weak var LogInBttn: UIButton!
    
    var dic : [String:String] = [:]
    
    var imgArr = [ UIImage(named: "LaunchingImg1"),
                   UIImage(named: "LaunchingImg2"),
                   UIImage(named: "LaunchingImg3"),
                   UIImage(named: "LaunchingImg4")
                   
    ]
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        GuestBttn.BttnDesign()
        LogInBttn.BttnDesign()
    }
    
    @objc func changeImage(){
        
        if counter < imgArr.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
            
        }else {
            
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func populate(_ sender: Any) {
        //addidas
        dic = ["name": "Black Addidas shoes", "description": "Black shoes perfect for running and outdoor activities", "category": "Addidas", "image": "BAddidas1", "image2" : "BAddidas2", "image3" : "BAddidas3"]
        DBHelper.inst.addItem(object: dic, price: 39.99)
        dic = ["name": "Blue Addidas shoes", "description": "Blue shoes perfect for running and outdoor activities, lifting as well", "category": "Addidas", "image": "BlAddidas1", "image2" : "BlAddidas2", "image3" : "BlAddidas3"]
        DBHelper.inst.addItem(object: dic, price: 29.99)
        dic = ["name": "Camo Addidas shoes", "description": "Camo shoes perfect for running and outdoor activities", "category": "Addidas", "image": "CAddidas1", "image2" : "CAddidas2", "image3" : "CAddidas3"]
        DBHelper.inst.addItem(object: dic, price: 59.99)
        dic = ["name": "Red Addidas shoes", "description": "Red shoes perfect for running and outdoor activities, lifting as well", "category": "Addidas", "image": "RAddidas1", "image2" : "RAddidas2", "image3" : "RAddidas3"]
        DBHelper.inst.addItem(object: dic, price: 19.99)
        dic = ["name": "White Addidas shoes", "description": "White shoes perfect for running and outdoor activities, lifting as well", "category": "Addidas", "image": "WAddidas1", "image2" : "WAddidas2", "image3" : "WAddidas3"]
        DBHelper.inst.addItem(object: dic, price: 79.99)
        
        //Apple
        dic = ["name": "Apple iPhone7", "description": "Apple iPhone perfect for the frugal shopper", "category": "Apple", "image": "iPhone7(1)", "image2" : "iPhone7(2)", "image3" : "iPhone7(3)"]
        DBHelper.inst.addItem(object: dic, price: 399.99)
        dic = ["name": "Apple iPhone11", "description": "Apple iPhone perfect for the super frugal shopper", "category": "Apple", "image": "iPhone11(1)", "image2" : "iPhone11(2)", "image3" : "iPhone11(3)"]
        DBHelper.inst.addItem(object: dic, price: 299.99)
        dic = ["name": "Apple iPhoneSE", "description": "Apple iPhone that is reliable and perfect for buisness", "category": "Apple", "image": "iPhoneSE(1)", "image2" : "iPhoneSE(2)", "image3" : "iPhoneSE(3)"]
        DBHelper.inst.addItem(object: dic, price: 599.99)
        dic = ["name": "Apple iPhone12", "description": "Apple iPhone that is reliable and perfect for buisness", "category": "Apple", "image": "iPhone12(1)", "image2" : "iPhone12(2)", "image3" : "iPhone12(3)"]
        DBHelper.inst.addItem(object: dic, price: 199.99)
        dic = ["name": "Apple iPhoneXS", "description": "Apple iPhone that is reliable and perfect for buisness", "category": "Apple", "image": "iPhoneXS(1)", "image2" : "iPhoneXS(2)", "image3" : "iPhoneXS(3)"]
        DBHelper.inst.addItem(object: dic, price: 799.99)
        
        //Gucci
        dic = ["name": "Black Gucci Bag", "description": "Black Gucci bag is the perfect walking bag", "category": "Gucci", "image": "BGucci1", "image2" : "BGucci2", "image3" : "BGucci3"]
        DBHelper.inst.addItem(object: dic, price: 1999.99)
        dic = ["name": "Dark Blue Gucci handbag", "description": "Small and affordable dark blue handbag", "category": "Gucci", "image": "DBGucci1", "image2" : "DBGucci1", "image3" : "DBGucci1"]
        DBHelper.inst.addItem(object: dic, price: 3999.99)
        dic = ["name": "Blue Gucci Bag", "description": "Blue Gucci bag is the perfect walking bag with a stylish design", "category": "Gucci", "image": "BGucci1", "image2" : "BGucci2", "image3" : "BGucci3"]
        DBHelper.inst.addItem(object: dic, price: 999.99)
        dic = ["name": "Polka Dot Gucci Bag", "description": "Polka Dot bag is the perfect walking bag with a stylish design", "category": "Gucci", "image": "PDGucci1", "image2" : "PDGucci2", "image3" : "PDGucci3"]
        DBHelper.inst.addItem(object: dic, price: 399.99)
        dic = ["name": "Red Gucci Bag", "description": "Red Gucci bag is the perfect walking bag", "category": "Gucci", "image": "RGucci1", "image2" : "RGucci2", "image3" : "RGucci3"]
        DBHelper.inst.addItem(object: dic, price: 2999.99)
        //Nike
        
        dic = ["name": "Black Grey Nike shoes", "description": "Black Grey shoes perfect for running and outdoor activities", "category": "Nike", "image": "BGrey_Nike1", "image2" : "BGrey_Nike2", "image3" : "BGrey_Nike3"]
        DBHelper.inst.addItem(object: dic, price: 19.99)
        dic = ["name": "Pink Nike shoes", "description": "Pink shoes perfect for running and outdoor activities, lifting as well", "category": "Nike", "image": "Pink_Nike1", "image2" : "Pink_Nike2", "image3" : "Pink_Nike3"]
        DBHelper.inst.addItem(object: dic, price: 39.99)
        dic = ["name": "Black Nike shoes", "description": "Black shoes perfect for running and outdoor activities", "category": "Nike", "image": "Black_Nike1", "image2" : "Black_Nike2", "image3" : "Black_Nike3"]
        DBHelper.inst.addItem(object: dic, price: 99.99)
        dic = ["name": "Red Nike shoes", "description": "Red shoes perfect for running and outdoor activities, lifting as well", "category": "Nike", "image": "RBlack_Nike1", "image2" : "RBlack_Nike2", "image3" : "RBlack_Nike3"]
        DBHelper.inst.addItem(object: dic, price: 79.99)
        dic = ["name": "White Addidas shoes", "description": "White shoes perfect for running and outdoor activities, lifting as well", "category": "Nike", "image": "White_Nike1", "image2" : "White_Nike2", "image3" : "White_Nike3"]
        DBHelper.inst.addItem(object: dic, price: 29.99)
        
        //HP
        
        dic = ["name": "Black HP Computer", "description": "Black HP Computer perfect for work or play", "category": "HP", "image": "BComputer1", "image2" : "BComputer2", "image3" : "BComputer3"]
        DBHelper.inst.addItem(object: dic, price: 799.99)
        dic = ["name": "Black Grey HP Computer", "description": "Black Grey HP Computer perfect for work or play", "category": "HP", "image": "BGComputer1", "image2" : "BGComputer2", "image3" : "BGComputer3"]
        DBHelper.inst.addItem(object: dic, price: 699.99)
        dic = ["name": "Blue HP Computer", "description": "Blue HP Computer perfect for the casual user", "category": "HP", "image": "BlComputer1", "image2" : "BlComputer2", "image3" : "BlComputer3"]
        DBHelper.inst.addItem(object: dic, price: 499.99)
        dic = ["name": "Pink HP Computer", "description": "Pink HP Computer perfect for everyday use", "category": "HP", "image": "PComputer1", "image2" : "PComputer2", "image3" : "PComputer3"]
        DBHelper.inst.addItem(object: dic, price: 399.99)
        dic = ["name": "Red HP Computer", "description": "Red HP Computer is expensive, for high performance", "category": "HP", "image": "RComputer1", "image2" : "RComputer2", "image3" : "RComputer3"]
        DBHelper.inst.addItem(object: dic, price: 2999.99)
        
        //PS3
        dic = ["name": "Birds of Steel", "description": "Game with planes", "category": "PS3", "image": "BPS31", "image2" : "BPS32", "image3" : "BPS33"]
        DBHelper.inst.addItem(object: dic, price: 9.99)
        dic = ["name": "MLB the Show", "description": "Baseball Game", "category": "PS3", "image": "MLBPS31", "image2" : "MLBPS32", "image3" : "MLBPS33"]
        DBHelper.inst.addItem(object: dic, price: 29.99)
        dic = ["name": "Minecraft PS3 edition", "description": "Best selling videogame of all time", "category": "PS3", "image": "MPS31", "image2" : "MPS32", "image3" : "MPS33"]
        DBHelper.inst.addItem(object: dic, price: 49.99)
        dic = ["name": "Persona 5", "description": "Anime people fighting at school", "category": "PS3", "image": "PPS31", "image2" : "PPS32", "image3" : "PPS33"]
        DBHelper.inst.addItem(object: dic, price: 39.99)
        dic = ["name": "Sonic Collection", "description": "Sonic collection which has over 15 games from the franchise", "category": "PS3", "image": "SPS31", "image2" : "SPS32", "image3" : "SPS33"]
        DBHelper.inst.addItem(object: dic, price: 5.99)
        
    }
    
    @IBAction func LogInPage(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "LogInPage") as! LoginCtrl
        present(vc, animated: true, completion: nil)
        
    }
    

    
    
}


extension LaunchingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? LaunchingViewCell
        
        cell?.LaunchingImg.image = imgArr[indexPath.row]
        
        return cell!
    }
}
