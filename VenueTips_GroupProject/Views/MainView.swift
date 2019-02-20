//
//  MainView.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/11/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class MainView: UIView {
    lazy var venueSearchBar: UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.placeholder = "E.g Sushi, Tacos, Halal, etc."
        return searchBar
    }()
    lazy var button0: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "lunch"), for: .normal)
        button.setTitle("Lunch", for: .normal)
        button.layer.borderColor = #colorLiteral(red: 0.9241021276, green: 0.6724008918, blue: 0.9294951558, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.2221263647, green: 0.5435168147, blue: 1, alpha: 1), for: .normal)
        button.tag = 0
        return button
    }()
    lazy var button1: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "sandwich"), for: .normal)
        button.layer.borderColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1, green: 0.7747257352, blue: 0, alpha: 1), for: .normal)
        button.tag = 1
        return button
    }()
    lazy var button2: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "coffee"), for: .normal)
        button.setTitle("Coffee", for: .normal)
        button.layer.borderColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1), for: .normal)
        button.tag = 2
        return button
    }()
    lazy var button3: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "party"), for: .normal)
        button.setTitle("Night Life", for: .normal)
        button.layer.borderColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1), for: .normal)
        button.tag = 3
        return button
    }()
    lazy var button4: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "park"), for: .normal)
        button.setTitle("Parks", for: .normal)
        button.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1), for: .normal)
        button.tag = 4
        return button
    }()
    lazy var button5: UIButton = {
        var button = UIButton()
        button.setTitle("Gyms", for: .normal)
        button.setImage(UIImage(named: "dumbell"), for: .normal)
        button.layer.borderColor = #colorLiteral(red: 0.4441329837, green: 0.473487258, blue: 0.9047655463, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), for: .normal)
        button.tag = 5
        return button
    }()
    lazy var exploreNearByLabel: UILabel = {
        var label = UILabel()
        label.text = "Explore Nearby"
//        label.font = UIFont(name: "Arial", size: 22)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    lazy var exploreNearByCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 50, height: 50)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        var collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        collectionView.layer.borderWidth = 4
        collectionView.backgroundColor = .clear
        return collectionView
    }()
   lazy var buttons = [UIButton]()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        backgroundColor = .white
        exploreNearByCollectionView.register(MainViewCell.self, forCellWithReuseIdentifier: "MainViewCell")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func commonInit(){
        buttons = [button0, button1, button2, button3, button4, button5]
        setupViews()
    }
    func setupViews(){
        setupSearchBar()
        //        setupStackView()
        setupButtons(buttons: [button0, button1, button2, button3, button4, button5])
        setupLabel()
        setupCollectionView()
        
    }
    func setupButtons(buttons: [UIButton]){
        for button in buttons{
            addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 90).isActive = true
            button.widthAnchor.constraint(equalToConstant: 90).isActive = true
            button.backgroundColor = .clear
            button.layer.borderWidth = 5
            button.layer.cornerRadius = 10
            
        }
        button1.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button1.topAnchor.constraint(equalTo: venueSearchBar.bottomAnchor, constant: 50).isActive = true
        button0.centerXAnchor.constraint(equalTo: button1.centerXAnchor, constant: -110).isActive = true
        button0.centerYAnchor.constraint(equalTo: button1.centerYAnchor).isActive = true
        button2.centerXAnchor.constraint(equalTo: button1.centerXAnchor, constant: 110).isActive = true
        button2.centerYAnchor.constraint(equalTo: button1.centerYAnchor).isActive = true
        button4.centerYAnchor.constraint(equalTo: button1.centerYAnchor, constant: 110).isActive = true
        button4.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button3.centerXAnchor.constraint(equalTo: button4.centerXAnchor, constant: -110).isActive = true
        button3.centerYAnchor.constraint(equalTo: button4.centerYAnchor).isActive = true
        button5.centerXAnchor.constraint(equalTo: button4.centerXAnchor, constant: 110).isActive = true
        button5.centerYAnchor.constraint(equalTo: button4.centerYAnchor).isActive = true
        
    }
    func setupSearchBar(){
        addSubview(venueSearchBar)
        venueSearchBar.translatesAutoresizingMaskIntoConstraints = false
        venueSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        venueSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        venueSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    func setupLabel(){
        addSubview(exploreNearByLabel)
        exploreNearByLabel.translatesAutoresizingMaskIntoConstraints = false
        exploreNearByLabel.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: 30).isActive = true
        exploreNearByLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive  = true
        exploreNearByLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        
    }
    func setupCollectionView(){
        addSubview(exploreNearByCollectionView)
        exploreNearByCollectionView.translatesAutoresizingMaskIntoConstraints = false
        exploreNearByCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        exploreNearByCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        exploreNearByCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        exploreNearByCollectionView.topAnchor.constraint(equalTo: exploreNearByLabel.bottomAnchor, constant: 20).isActive = true
    }
 

}
