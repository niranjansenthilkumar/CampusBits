//
//  AddBitController.swift
//  CampusBits
//
//  Created by Niranjan Senthilkumar on 8/18/18.
//  Copyright © 2018 NJ. All rights reserved.
//

import UIKit

var bitADDED: Bit = Bit(title: "", pagesTo: [], coverImage: #imageLiteral(resourceName: "sample"), backgroundImage: #imageLiteral(resourceName: "screen"))


class AddBitController: UITableViewController {
    
    let cellId = "cellId"
    
    var pageArray: [String] = ["Title", "Page"]
    
    let save: UIButton = {
        let label = UIButton()
        label.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        label.backgroundColor = .purple
        return label
    }()
    
    @objc func handleSave(){
        
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CustomTableCell.self, forCellReuseIdentifier: cellId)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "addbutton").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAdd))
        
        view.addSubview(save)
        save.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    }

    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return save
    }
    
    @objc func handleAdd(){
        
        pageArray.append("Page")
        
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: pageArray.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomTableCell

        let p = pageArray[indexPath.item]
        
        
        cell.label.text = p
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pageArray.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            self.pageArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)

        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let addTitleVC = AddTitleController()
            
            navigationController?.pushViewController(addTitleVC, animated: true)
            
        }
        
        else{
            let addPageVC = AddPageController()
            
            addPageVC.index = indexPath.row
            
            navigationController?.pushViewController(addPageVC, animated: true)
        }
    }
    
    
}
