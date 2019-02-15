//
//  SearchDetailedController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class SearchDetailedController: UIViewController {

    var searchDetailedView: SearchDetailedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(searchDetailedView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonPressed))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add Comment", style: .plain, target: self, action: #selector(addCommentPressed))
        
    }
    
    @objc func favoriteButtonPressed() {
        
    }

    @objc func addCommentPressed() {
        
    }
    
    
}
