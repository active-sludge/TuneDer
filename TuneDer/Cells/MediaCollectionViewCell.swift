//
//  MediaCollectionViewCell.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 14.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import UIKit

class MediaCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainMediaCell"
    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    
    var app: ResultModel! {
        didSet{
            self.setupCell()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func setupCell(){
        
        
        
        
    }
    
  
    
    static func nib() -> UINib {
        return UINib(nibName: "MediaCollectionViewCell", bundle: nil)
    }
}
