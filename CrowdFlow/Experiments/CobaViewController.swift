//
//  CobaViewController.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 17/01/24.
//

import UIKit

class CobaViewController: UIViewController {
    
    let collectionView = UICollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        
        let layout = UICollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        collectionView.register(AnyClass, forCellWithReuseIdentifier: <#T##String#>)
    }
    

}
