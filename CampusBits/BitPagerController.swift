//
//  BitPagerController.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/17/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit

class BitPagerController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var bit: Bit?
    
    let cellId = "cellId"
    let titleId = "titleId"
    let twitterId = "twitterId"


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.register(TitlePageCell.self, forCellWithReuseIdentifier: titleId)
        
        collectionView?.register(TwitterPageCell.self, forCellWithReuseIdentifier: twitterId)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cloze").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleCloseBook))
        
        
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0
        
        collectionView?.isPagingEnabled = true
    }
    
    @objc func handleCloseBook() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIColor.white.as1ptImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIColor.rgb(red: 232, green: 232, blue: 232).as1ptImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //[UIApplication sharedApplication].statusBarFrame.size.height
        
        
        return CGSize(width: view.frame.width, height: view.frame.height + 65)
    }
    
    func statusBarHeight() -> CGFloat {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        return Swift.min(statusBarSize.width, statusBarSize.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bit?.pages.count ?? 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let newPage = bit?.pages[indexPath.item]
//
//        if (newPage?.checkIfTwitter())! {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: twitterId, for: indexPath) as! TwitterPageCell
//
//            let page = bit?.pages[indexPath.item]
//
//            return cell
//        }
        
        let checkCell = collectionView.dequeueReusableCell(withReuseIdentifier: twitterId, for: indexPath) as! TwitterPageCell
        
        print(checkCell.authorLabel.text, "buggy")
        
        
        
        if bitADDED.pages[indexPath.row].author != "no author" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: twitterId, for: indexPath) as! TwitterPageCell
            let page = bit!.pages[indexPath.item]
            
            
            cell.textLabel.text = page.text
            
            cell.coverImage.image = page.coverImage
            cell.authorLabel.text = page.author
            cell.tagLabel.text = page.tag
            
            return cell
        }
        
//        if indexPath.row == 2 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: twitterId, for: indexPath) as! TwitterPageCell
//            let page = bit!.pages[indexPath.item]
//
//
//            cell.textLabel.text = page.text
//
//            cell.coverImage.image = page.coverImage
//            cell.authorLabel.text = page.author
//            cell.tagLabel.text = page.tag
//
//            return cell
//        }
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: titleId, for: indexPath) as! TitlePageCell
            
            let title = bit?.title
            
            let page = bit?.pages[indexPath.item]
            
            let imageView = UIImageView(image: bit?.backgroundImage)
            let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.dark)
            // 2
            let blurView = UIVisualEffectView(effect: darkBlur)
            blurView.frame = view.bounds
            imageView.addSubview(blurView)
            imageView.backgroundColor?.darker()
            
            
            cell.backgroundView = imageView
            
            
            //cell.backgroundColor = .black
            
            cell.textLabel.text = title
            cell.captionLabel.text = page?.text
            
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
            
            let page = bit?.pages[indexPath.item]
            cell.textLabel.text = page?.text
            
            return cell
        }
        
    }

}

extension UIColor {
    
    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}
