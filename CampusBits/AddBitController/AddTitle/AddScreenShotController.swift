//
//  AddScreenShotController.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/19/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit

class AddScreenShotController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let backgroundLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    let plusScreenshotButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "addbutton").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handlePlusPhoto), for: .touchUpInside)
        return button
    }()
    
    @objc func handlePlusPhoto(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            plusScreenshotButton.setImage(editedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
            
        else if let originalImage = info["UIImagePickerControllerOriginialImage"] as? UIImage{
            plusScreenshotButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }

        plusScreenshotButton.layer.borderColor = UIColor.black.cgColor
        plusScreenshotButton.layer.borderWidth = 3
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundLabel)
        backgroundLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.backgroundColor = UIColor.rgb(red: 247, green: 247, blue: 247)

        view.addSubview(plusScreenshotButton)
        plusScreenshotButton.anchor(top: backgroundLabel.topAnchor, left: backgroundLabel.leftAnchor, bottom: backgroundLabel.bottomAnchor, right: backgroundLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))

        
    }
    
    @objc func handleSave(){
        guard let image = plusScreenshotButton.imageView?.image else {return}
        
        bitADDED.setBackground(background: image)
        
        navigationController?.popViewController(animated: true)
    }
}
