//
//  CustomTableCell.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/18/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Light", size: 14)
        //label.backgroundColor = .green
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(label)
        label.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 23, paddingBottom: 0, paddingRight: 0, width: 200, height: 27)
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
