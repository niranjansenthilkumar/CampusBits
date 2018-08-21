//
//  TwitterPageCell.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/17/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit

class TwitterPageCell: UICollectionViewCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 20)
        label.textColor = .black
        label.text = "SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        label.textColor = .black
        label.text = "Niranjan Senthilkumar"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 16)
        label.textColor = UIColor.rgb(red: 155, green: 155, blue: 155)
        label.text = "@njkumarr"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let coverImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        image.layer.borderWidth = 0
        return image
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(textLabel)
        textLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 280, paddingLeft: 30, paddingBottom: 290, paddingRight: 10, width: 0, height: 0)
        textLabel.sizeToFit()
        
        addSubview(coverImage)
        coverImage.anchor(top: nil, left: leftAnchor, bottom: textLabel.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 5, paddingRight: 320, width: 40, height: 40)
    
        addSubview(authorLabel)
        authorLabel.anchor(top: nil, left: coverImage.rightAnchor, bottom: nil, right: nil, paddingTop: 13, paddingLeft: 5, paddingBottom: 13, paddingRight: 100, width: 0, height: 0)
        authorLabel.centerYAnchor.constraint(equalTo: coverImage.centerYAnchor).isActive = true
        
        addSubview(tagLabel)
        tagLabel.anchor(top: authorLabel.topAnchor, left: authorLabel.rightAnchor, bottom: authorLabel.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VerticalTopAlignLabel: UILabel {
    
    override func drawText(in rect:CGRect) {
        guard let labelText = text else {  return super.drawText(in: rect) }
        
        let attributedText = NSAttributedString(string: labelText, attributes: [NSAttributedStringKey.font: font])
        var newRect = rect
        newRect.size.height = attributedText.boundingRect(with: rect.size, options: .usesLineFragmentOrigin, context: nil).size.height
        
        if numberOfLines != 0 {
            newRect.size.height = min(newRect.size.height, CGFloat(numberOfLines) * font.lineHeight)
        }
        
        super.drawText(in: newRect)
    }
    
}
