//
//  MediaCollectionViewCell.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 14.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MediaCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainMediaCell"

    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    var app: Media! {
        didSet{
            self.setupCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .cyan
        thumbnail.backgroundColor = .black
        thumbnail.tintColor = .yellow
        
        trackName.textAlignment = .right
        
        artistName.textAlignment = .right
        
    }
    
    func setupCell(){
        artistName.text = app.artistName
        trackName.text = app.trackName
        thumbnail.af.setImage(withURL: URL(string: app.artworkUrl100)!)
    }
}
