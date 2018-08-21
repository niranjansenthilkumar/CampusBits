//
//  Models.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/17/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit

class Bit {
    var title: String
    var pages: [Page]
    var coverImage: UIImage
    var backgroundImage: UIImage
    
    init(title: String, pagesTo: [Page], coverImage: UIImage, backgroundImage: UIImage){
        self.title = title
        self.coverImage = coverImage
        self.backgroundImage = backgroundImage
    
        var bitPages = [Page]()
        
        for page in pagesTo {
            if(page.checkIfTwitter()){
                let newPage = Page(number: page.number, text: page.text, author: page.author!, tag: page.tag!, coverImage: page.coverImage!)
                bitPages.append(newPage)
            }
            else{
                let newPage = Page(number: page.number, text: page.text)
                bitPages.append(newPage)
            }
        }
        
        self.pages = bitPages
    }
    
    func setTitle(title: String){
        self.title = title
    }
    
    func setImage(coverImage: UIImage){
        self.coverImage = coverImage
    }
    
    func setBackground(background: UIImage){
        self.backgroundImage = background
    }
//    
//    init(dictionary: [String: Any]) {
//        self.title = dictionary["title"] as? String ?? ""
//        self.coverImage = dictionary["coverImage"] as? UIImage ?? #imageLiteral(resourceName: "sample")
//        
//        var bookPages = [Page]()
//        
//        if let pagesDictionaries = dictionary["pages"] as? [[String: Any]] {
//            for pageDictionary in pagesDictionaries {
//                if let pageText = pageDictionary["text"] as? String {
//                    let page = Page(number: 1, text: pageText)
//                    bookPages.append(page)
//                }
//            }
//        }
//        
//        pages = bookPages
//    }
}


class Page {
    var number: Int
    var text: String
    var author: String? = "no author"
    var tag: String?
    var coverImage: UIImage?
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
    
    init(number: Int, text: String, author: String, tag: String, coverImage: UIImage){
        self.number = number
        self.text = text
        self.author = author
        self.tag = tag
        self.coverImage = coverImage
    }
    
    func checkIfTwitter() -> Bool {
        if self.author == "no author" {
            return false
        }
        else{
            return true
        }
    }

}


