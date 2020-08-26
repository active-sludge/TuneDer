//
//  DetailViewController.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 20.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!
   
    var data = DetailModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumCover.af.setImage(withURL: URL(string: data.thumbnailURLString)!)
        artistName.text = data.artistName
        trackName.text = data.trackName
        
    }

}
