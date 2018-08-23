//
//  AddPageController.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/18/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit

class AddPageController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var index: Int?
    
    var backgroundImage: UIImage?
    
    let text: UITextField = {
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
    
    let author: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "Avenir-Light", size: 14)
        tf.placeholder = "Author"
        tf.backgroundColor = .white
        return tf
    }()
    
    let tag: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "Avenir-Light", size: 14)
        tf.placeholder = "Tag"
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
        
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width/2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.black.cgColor
        plusPhotoButton.layer.borderWidth = 3
        
        dismiss(animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundLabel)
        backgroundLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 100, paddingLeft: 0, paddingBottom: 100, paddingRight: 0, width: 0, height: 0)
        
        
        view.backgroundColor = UIColor.rgb(red: 247, green: 247, blue: 247)
        
        view.addSubview(text)
        text.anchor(top: backgroundLabel.topAnchor, left: backgroundLabel.leftAnchor, bottom: nil, right: backgroundLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
        
        view.addSubview(author)
        author.anchor(top: nil, left: backgroundLabel.leftAnchor, bottom: backgroundLabel.bottomAnchor, right: backgroundLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.anchor(top: text.bottomAnchor, left: backgroundLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 140, height: 140)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        
        view.addSubview(saveButton)
        saveButton.anchor(top: text.bottomAnchor, left: nil, bottom: nil, right: backgroundLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 140, height: 140)
        saveButton.layer.borderWidth = 1.0
        
        
        view.addSubview(tag)
        tag.anchor(top: saveButton.bottomAnchor, left: backgroundLabel.leftAnchor, bottom: nil, right: backgroundLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @objc func handleSave(){
        
        guard let textPara = text.text else {return}
        
        guard let ind = index else {return}
        
        if author.text == "" {
            
            let p = Page(number: ind, text: textPara)
            
            if(!bitADDED.pages.indices.contains(ind)){
                bitADDED.pages.append(p)
            }
            else{
                bitADDED.pages[ind] = p
            }
        }
        else{
            
            guard let authorPara = author.text else{ return }
            
            guard let tagPara = tag.text else{ return }

            guard let image = plusPhotoButton.imageView?.image else{ return }

            
            let p = Page(number: ind, text: textPara, author: authorPara, tag: tagPara, coverImage: image)
            
            if(!bitADDED.pages.indices.contains(ind)){
                bitADDED.pages.append(p)
            }
            else{
                bitADDED.pages[ind] = p
            }
        }
        
        navigationController?.popViewController(animated: true)
        
    }
}
