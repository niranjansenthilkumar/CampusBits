//
//  TitlePageCell.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/17/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit

class TitlePageCell: UICollectionViewCell {
    
    let backgroundLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 24)
        label.textColor = .white
        label.text = "SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        label.backgroundColor = .green
        return label
    }()
    
    let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 16)
        label.textColor = .white
        label.text = "SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .blue
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(backgroundLabel)
        backgroundLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 250, paddingLeft: 15, paddingBottom: 350, paddingRight: 10, width: 0, height: 0)
        
//        addSubview(textLabel)
//        textLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 250, paddingLeft: 15, paddingBottom: 415, paddingRight: 10, width: 0, height: 0)
//
//        addSubview(captionLabel)
//        captionLabel.anchor(top: textLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 350, paddingRight: 10, width: 0, height: 0)
        
        layoutViews()
        
    }
    
    func layoutViews(){
        let stackView = UIStackView(arrangedSubviews: [textLabel, captionLabel])
        stackView.distribution = .fillEqually
        
        stackView.axis = .vertical
                
        addSubview(stackView)
        stackView.anchor(top: backgroundLabel.topAnchor, left: backgroundLabel.leftAnchor, bottom: backgroundLabel.bottomAnchor, right: backgroundLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
