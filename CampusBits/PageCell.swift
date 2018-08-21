//
//  PageCell.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/17/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 20)
        label.text = "SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let backgroundLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(backgroundLabel)
        backgroundLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 250, paddingLeft: 15, paddingBottom: 350, paddingRight: 10, width: 0, height: 0)
        
        addSubview(textLabel)
        textLabel.anchor(top: backgroundLabel.topAnchor, left: backgroundLabel.leftAnchor, bottom: backgroundLabel.bottomAnchor, right: backgroundLabel.rightAnchor , paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
//        textLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
//        textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        textLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
