//
//  AddTitleController.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/18/18.
//  Copyright © 2018 NJ. All rights reserved.
//


import UIKit

class AddTitleController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var backgroundImage: UIImage?
    
    let titleTF: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "Avenir-Light", size: 14)
        tf.placeholder = "Title"
        tf.backgroundColor = .white
        return tf
    }()
    
    let backgroundLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let captionTF: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "Avenir-Light", size: 14)
        tf.placeholder = "Caption"
        tf.backgroundColor = .white
        return tf
    }()
    
    let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "addbutton").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handlePlusPhoto), for: .touchUpInside)
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.text = "Save"
        button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        return button
    }()
    
    @objc func handleSave(){
        
        guard let email = titleTF.text else { return }
        
        guard let image = plusPhotoButton.imageView?.image else {return}
        
        guard let caption = captionTF.text else {return}
        
        let p: Page = Page(number: 0, text: caption)

        
        print(email, "popop", "twot")
        
        if bitADDED.pages.count == 0 {
            bitADDED.pages.append(p)
        }
        
        else{
            bitADDED.pages[0] = p
        }
        
        bitADDED.setTitle(title: email)
        bitADDED.setImage(coverImage: image)
        
        navigationController?.popViewController(animated: true)
    }

    
    @objc func handlePlusPhoto(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            plusPhotoButton.setImage(editedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
            
        else if let originalImage = info["UIImagePickerControllerOriginialImage"] as? UIImage{
            plusPhotoButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        
//        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width/2
//        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.black.cgColor
        plusPhotoButton.layer.borderWidth = 3
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundLabel)
        backgroundLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 100, paddingLeft: 0, paddingBottom: 100, paddingRight: 0, width: 0, height: 0)
        

        view.backgroundColor = UIColor.rgb(red: 247, green: 247, blue: 247)
        
        view.addSubview(titleTF)
        titleTF.anchor(top: backgroundLabel.topAnchor, left: backgroundLabel.leftAnchor, bottom: nil, right: backgroundLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
        
        view.addSubview(captionTF)
        captionTF.anchor(top: nil, left: backgroundLabel.leftAnchor, bottom: backgroundLabel.bottomAnchor, right: backgroundLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.anchor(top: titleTF.bottomAnchor, left: backgroundLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 140, height: 140)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(handleScreenshot))
        
        view.addSubview(saveButton)
        saveButton.anchor(top: titleTF.bottomAnchor, left: nil, bottom: nil, right: backgroundLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 140, height: 140)
        saveButton.layer.borderWidth = 1.0
        
    }
    
    @objc func handleScreenshot(){
        
        let screenVC = AddScreenShotController()
        
        navigationController?.pushViewController(screenVC, animated: true)
        
    }

}
