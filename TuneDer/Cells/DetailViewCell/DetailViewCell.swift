//
//  DetailViewCell.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 28.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewCell: UITableViewCell {
    
    static let identifier = "DetailViewCell"
    
    var detail : DetailModel? {
        didSet {
            albumCover.af.setImage(withURL: URL(string: detail!.thumbnailURLString)!)
            trackNameLabel.text = detail?.trackName
            artistNameLabel.text = detail?.artistName
        }
    }
    
    var artistNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .center
        return lbl
    }()
    
    var trackNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .center
        return lbl
    }()
    
    var albumCover: UIImageView = {
        let imgView = UIImageView(image: .checkmark)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(albumCover)
        addSubview(trackNameLabel)
        addSubview(artistNameLabel)
        
        albumCover.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        trackNameLabel.anchor(top: topAnchor, left: albumCover.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        artistNameLabel.anchor(top: trackNameLabel.bottomAnchor, left: albumCover.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)

        let stackView = UIStackView(arrangedSubviews: [albumCover, trackNameLabel, artistNameLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)
        
        stackView.anchor(top: topAnchor, left: trackNameLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 10, width: 0, height: 70, enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
