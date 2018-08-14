//
//  SettingsController.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/14/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        view.backgroundColor = UIColor.rgb(red: 247, green: 247, blue: 247)

        self.navigationItem.hidesBackButton = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:#imageLiteral(resourceName: "backButton2x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(goBack))

    }
    
    @objc func goBack(){
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        self.navigationController?.popViewController(animated: false)
    }
    
}
