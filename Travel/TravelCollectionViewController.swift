//
//  TravelCollectionViewController.swift
//  Travel
//
//  Created by Windson on 2017/8/16.
//  Copyright © 2017年 Windson. All rights reserved.
//

import UIKit
import SwiftyJSON


private let reuseIdentifier = "CountryCell"

class TravelCollectionViewController: UICollectionViewController {
    
    var countryList: [JSON]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCountry() {responseObject, error in
            if let country = responseObject {
                self.countryList = country
                self.collectionView?.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountryCell", for: indexPath) as! CountryCell
        if let data = self.countryList {
            cell.CountryName.text = data.map({$0["name"].stringValue})[indexPath.row]
            cell.CountryFlag.image = UIImage(named: data.map({$0["thumbnail"].stringValue})[indexPath.row])
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                withReuseIdentifier: "TravelHeaderReusableView", for: indexPath) as! TravelHeaderReusableView
            headerView.CountryImage.image = UIImage(named: "travel.jpg")
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        return CGSize(width: width, height: height)
    }
}
