//
//  VenueListCell.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/19/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class VenueListCell: UITableViewCell {

    lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Label"
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        var label = UILabel()
        label.text = "Label"
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    lazy var venueImage: UIImageView = {
       var image = UIImageView()
        image.image = UIImage(named: "placeholder")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "VenueListCell")
        addImage()
        addLabel(labels: [nameLabel,addressLabel])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addImage(){
        addSubview(venueImage)
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        venueImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
        venueImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        venueImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        venueImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
    func addLabel(labels: [UILabel]) {
        for label in labels {
            addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
        }
        nameLabel.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 25).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor, constant: 10).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
}
