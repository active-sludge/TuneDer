//
//  CollectionViewController.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 13.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    let dataSource: [String] = ["Artist0", "Artist1", "Artist2", "Artist3", "Artist4", "Artist5", "Artist6" ]
    
    var resultManager = ResultManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultManager.fetchResult()

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let mediaCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            mediaCell.configure(with: dataSource[indexPath.row])
            
            cell = mediaCell
        }
        
        return cell
    }
    
    


}
