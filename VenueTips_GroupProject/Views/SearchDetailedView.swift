//
//  SearchDetailedView.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class SearchDetailedView: UIView {

    lazy var venueImage: UIImageView = {
        let venueImage = UIImageView()
        return venueImage
    }()
    
    lazy var venueName: UILabel = {
        let venueName = UILabel()
        venueName.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return venueName
    }()
    
    lazy var venueAddress: UIButton = {
        let venueAddress = UIButton()
        venueAddress.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
      venueAddress.titleLabel?.textColor = .black
        return venueAddress
    }()
    
    lazy var commentsLabel: UILabel = {
        let commentsLabel = UILabel()
        commentsLabel.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return commentsLabel
    }()
    
    lazy var commentsScrollView: UIScrollView = {
        let commentsScrollView = UIScrollView()
        commentsScrollView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return commentsScrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.addSubview(venueImage)
        self.addSubview(venueName)
        self.addSubview(venueAddress)
        self.addSubview(commentsLabel)
        self.addSubview(commentsScrollView)
        setConstraints()
    }
    
    func setConstraints() {
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        venueImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        venueImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        venueImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        venueImage.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        venueName.translatesAutoresizingMaskIntoConstraints = false
        venueName.topAnchor.constraint(equalTo: venueImage.bottomAnchor, constant: 11).isActive = true
        venueName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        venueName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        venueName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        venueAddress.translatesAutoresizingMaskIntoConstraints = false
        venueAddress.topAnchor.constraint(equalTo: venueName.bottomAnchor, constant: 11).isActive = true
        venueAddress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        venueAddress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        venueAddress.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        commentsLabel.translatesAutoresizingMaskIntoConstraints = false
        commentsLabel.topAnchor.constraint(equalTo: venueAddress.bottomAnchor, constant: 11).isActive = true
        commentsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        commentsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        commentsLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        commentsScrollView.translatesAutoresizingMaskIntoConstraints = false
        commentsScrollView.topAnchor.constraint(equalTo: commentsLabel.bottomAnchor, constant: 11).isActive = true
        commentsScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        commentsScrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        commentsScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 11).isActive = true
        
    }
    
    
}


