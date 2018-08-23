//
//  BitController.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/14/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit
import Firebase

class BitController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let cellId = "cellId"
    
    var bits = [Bit(title: "Fortnite ditches Google Play Store for upcoming launch", pagesTo: [Page(number: 0, text: "My boys only like cash, that shit is golden yo! Tweeting ") ,Page(number: 1, text: "My boys only like cash, that shit is golden yo! Tweeting like its bolden yo! ferferferf fasiofefwfoa aofjwoei wefjiwoefjowe wefiwjowefwe"), Page(number: 2, text: "It looks more like a math problem than a logo for an official sport at a major multisport event recognized by the International Olympic Committee.", author: "Cornell Daily Sun", tag: "Niranjan Senthilkumar", coverImage: #imageLiteral(resourceName: "sample"))], coverImage: #imageLiteral(resourceName: "sample"), backgroundImage: #imageLiteral(resourceName: "screen"))]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.rgb(red: 247, green: 247, blue: 247)
        
        navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "Latest Bits2x"))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image:#imageLiteral(resourceName: "infobutton").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleInfo))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "addbutton").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAdd))
        
        collectionView?.register(BitCell.self, forCellWithReuseIdentifier: cellId)
        
        
        print(bits.count, "popop")
        
        DispatchQueue.main.async {
            self.collectionView?.reloadSections(IndexSet(integer: 0))
        }
        
        collectionView?.dataSource = self
        collectionView?.delegate = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        bits.append(bitADDED)
        self.collectionView?.reloadSections(IndexSet(integer: 0))
    }

    
    @objc func handleAdd(){
        let push = AddBitController()
        
        navigationController?.pushViewController(push, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BitCell
        
        
        let titleBit = bits[indexPath.row]
        
        print(titleBit.title)
            
        cell.articleImage.image = titleBit.coverImage.withRenderingMode(.alwaysOriginal)

//
//        if indexPath.row == 2 {
//            cell.titleLabel.text = "Fortnite ditches Google Play Store for upcoming launch"
//            cell.dateLabel.text = "3d ago"
//        }
        
        cell.titleLabel.text = titleBit.title
        
        
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
        
        print(bits.count, "omg")
        
        return bits.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let selectedBit = self.bits?[indexPath.row]
        //        print(book?.title)
        //        return
        
        let selectedBit = bits[indexPath.row]
        
        let layout = UICollectionViewFlowLayout()
        let bitpagerVC = BitPagerController(collectionViewLayout: layout)
        
        bitpagerVC.bit = selectedBit
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        self.navigationController?.pushViewController(bitpagerVC, animated: true)
        
    }
    
    
    @objc func handleInfo(){        
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
