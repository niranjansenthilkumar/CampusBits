//
//  BitController.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/14/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit

class BitController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.rgb(red: 247, green: 247, blue: 247)
        
        navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "Latest Bits2x"))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image:#imageLiteral(resourceName: "infobutton").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleInfo))
        
        collectionView?.register(BitCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BitCell
        
        cell.articleImage.image = #imageLiteral(resourceName: "sample").withRenderingMode(.alwaysOriginal)
        
        if indexPath.row == 2 {
            cell.titleLabel.text = "Fortnite ditches Google Play Store for upcoming launch"
            cell.dateLabel.text = "3d ago"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 7, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 81)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    @objc func handleInfo(){
        //let pastVC = PastFoodController(collectionViewLayout: UICollectionViewFlowLayout())
        
        let settingsVC  = SettingsController()
        
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        settingsVC.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "About"))
        
        self.navigationController?.pushViewController(settingsVC, animated: false)
    }
}
