//
//  ColumnFlowLayout.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 18.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {
    
    private let minColumnWidth: CGFloat = 300.0
    private let cellHeight: CGFloat = 70.0

    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let maxNumColumns = Int(availableWidth / minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        self.itemSize = CGSize(width: cellWidth, height: cellHeight)
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        self.sectionInsetReference = .fromSafeArea
        
    }
    
    
}
