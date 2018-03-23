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
        //to change the default scrolldirection inside each blue colored view to horizontal
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.blue
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }

    
    func setupViews()  {
        backgroundColor = UIColor.black
        let appCV = appsCollectionView()
        appCV.dataSource = self
        appCV.delegate = self
        appCV.register(AppCell.self, forCellWithReuseIdentifier: "appCellId")
        addSubview(appCV)
        // expand horizontally from left to write edge : horizontal axis
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : appCV]))
        // expand horizontally from top to bottom edge : vertical  axis
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : appCV]))
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
        return CGSize(width: 150 , height:collectionView.frame.height )
    }
    
}




class AppCell : UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }

    func setupViews()  {
        backgroundColor = UIColor.brown
    }
}
