//
//  CollectionViewCell.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 13.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet private weak var mediaLabel: UILabel!
    
    func configure(with dataName: String){
        mediaLabel.text = dataName
    }
    
}
