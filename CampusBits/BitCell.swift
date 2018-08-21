//
//  BitCell.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/14/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit

class BitCell: UICollectionViewCell {
    
    let articleImage: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.layer.cornerRadius = 4
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 14)
        label.text = "Bit Cell"
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .red
        label.font = UIFont(name: "Avenir-Medium", size: 12)
        label.textColor = UIColor.rgb(red: 170, green: 170, blue: 170)
        label.text = "16h ago"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .black
        
        setupChannelCell()
        
        addSubview(articleImage)
        articleImage.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15.5, paddingLeft: 0, paddingBottom: 15.5, paddingRight: 20, width: 50, height: 50)
        articleImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 17, paddingBottom: 30, paddingRight: 100, width: 0, height: 0)
        
        addSubview(dateLabel)
        dateLabel.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 3, paddingLeft: 0, paddingBottom: 12, paddingRight: 0, width: 50, height: 0)
    }
    
    func setupChannelCell(){
        
        backgroundColor = .white
        //layer.masksToBound = true
        layer.cornerRadius = 6
        
//        layer.shadowColor = UIColor.gray.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 0.0)
//        layer.shadowRadius = 2.0
//        layer.shadowOpacity = 0.15
//        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width:0,height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.1
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.rgb(red: 232, green: 232, blue: 232).cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
