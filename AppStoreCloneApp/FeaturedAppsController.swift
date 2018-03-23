//
//  ViewController.swift
//  AppStoreCloneApp
//
//  Created by Udit Kapahi on 23/03/18.
//  Copyright © 2018 Udit Kapahi. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var appCategories:[AppCategory]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appCategories = AppCategory.sampleAppCateg()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: "cellId")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count{
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "cellId", for: indexPath) as! CategoryCell
        if let category = appCategories?[indexPath.item]{
            cell.appCategory = category
        }
        return cell
    }
    
    //overriden from UICollectionViewDelegateFlowLayout, helps to specify the size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
    
}




