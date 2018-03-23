//
//  CategoryCell.swift
//  AppStoreCloneApp
//
//  Created by Udit Kapahi on 23/03/18.
//  Copyright © 2018 Udit Kapahi. All rights reserved.
//

import UIKit

class CategoryCell : UICollectionViewCell, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }

    // This method returns one blue colored collection view
    func appsCollectionView() -> UICollectionView  {
        let layout = UICollectionViewFlowLayout()
        //to change the default scrolldirection inside each blue colored view to 
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }
    
    func categoryNameLabel() -> UILabel {
        let label = UILabel()
        label.text = "Category Name"
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    func dividerLine() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    
    func setupViews()  {
        backgroundColor = UIColor.clear
        let appCV = appsCollectionView()
        let dividerLineView = dividerLine()
        let categoryTitle = categoryNameLabel()
        
        appCV.dataSource = self
        appCV.delegate = self
        appCV.register(AppCell.self, forCellWithReuseIdentifier: "appCellId")
        addSubview(categoryTitle)
        addSubview(appCV)
        addSubview(dividerLineView)
        
        // expand category title horizontally from left to write edge : horizontal axis
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : categoryTitle]))
        
        // expand horizontally from left to write edge : horizontal axis
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : appCV]))
        // expand horizontally from top to bottom edge : vertical  axis
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[categoryTitle(30)][v0][v1(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : appCV,"v1":dividerLineView,"categoryTitle":categoryTitle]))
        
        // expand line horizontally from left to write edge : horizontal axis
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : dividerLineView]))
        
        
    }
    
    
    //MARK: DATASOURCE METHODS
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "appCellId", for: indexPath) as! AppCell
        return cell
    }
    
    //MARK: SIZING METHODS
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100 , height:collectionView.frame.height - 30 )
    }
    //margin method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    
}



//MARK: This class contains the layout of the app item cell
class AppCell : UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    func ourImageView() -> UIImageView {
        let iv = UIImageView()
        iv.image = UIImage (named:"dummy")
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = UIColor.orange
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }
    
    func appTitle() -> UILabel {
        let label = UILabel()
        label.text = "MY RANDOm app name here"
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 2
        return label
    }
    
    func categoryLabel() -> UILabel {
        let label = UILabel()
        label.text = "Category"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
    }
    
    func priceLabel() -> UILabel {
        let label = UILabel()
        label.text = "Price"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
    }

    func setupViews()  {
        let imageView = ourImageView()
        let title = appTitle()
        let label = categoryLabel()
        let price = priceLabel()
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        title.frame = CGRect(x: 0, y: frame.width + 4, width: frame.width, height: 40)
        label.frame = CGRect(x: 0, y: frame.width + 40, width: frame.width, height: 20)
        price.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
        addSubview(imageView)
        addSubview(title)
        addSubview(label)
        addSubview(price)
    }
}
