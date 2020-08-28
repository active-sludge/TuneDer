//
//  MainViewController.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 14.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire

class MainViewController: UIViewController {
    
    let urlString = "https://itunes.apple.com/search?term=jack+johnson"
    static let segueIdentifier = "goDetailViewController"
    
    let databaseManager = DatabaseManager()
    
    var mediaResults = [Media]()
    
    @IBOutlet weak var cView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ResultManager.shared.resultManagerDelegate = self
        
        if databaseManager.realm.isEmpty {
            
            ResultManager.shared.fetchThenStoreData(fromURL: urlString)
        } else {
            mediaResults = databaseManager.retrieveAsArray()
        }
        
        cView.delegate = self
        cView.dataSource = self
        self.cView.register(UINib(nibName: "MediaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainMediaCell")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == MainViewController.segueIdentifier {
            
            let destinationVC = segue.destination as! DetailViewController
            
            destinationVC.data = sender as! DetailModel
            
        }
    }
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("tapped")
        
        let realm = try! Realm()
        try! realm.write{
            if mediaResults[indexPath.row].isSelected == false {
                mediaResults[indexPath.row].isSelected = true
                cView.cellForItem(at: indexPath)?.backgroundColor = .darkGray
            } else if mediaResults[indexPath.row].isSelected == true {
                mediaResults[indexPath.row].isSelected = false
                cView.cellForItem(at: indexPath)?.backgroundColor = .cyan
            }
        }
        
        let detailViewData = DetailModel(
            trackName: mediaResults[indexPath.row].artistName,
            artistName: mediaResults[indexPath.row].trackName,
            thumbnailURLString: mediaResults[indexPath.row].artworkUrl100)
        
        performSegue(withIdentifier: MainViewController.segueIdentifier, sender: detailViewData)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    
    }
}


//MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.mediaResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.identifier, for: indexPath) as! MediaCollectionViewCell
        
        cell.artistName.text = self.mediaResults[indexPath.row].artistName
        cell.trackName.text = self.mediaResults[indexPath.row].trackName
        cell.thumbnail.af.setImage(withURL: URL(string: self.mediaResults[indexPath.row].artworkUrl100)!)
        if mediaResults[indexPath.row].isSelected == true {
            cell.backgroundColor = .darkGray
        } else {
            cell.backgroundColor = .cyan
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let minColumnWidth: CGFloat = 300.0
        let cellHeight: CGFloat = 140.0
        
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let maxNumColumns = Int(availableWidth / minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        return CGSize(width: cellWidth, height: cellHeight)
        
    }
}

//MARK: - MainViewController: ResultManagerProtocol

extension MainViewController: ResultManagerProtocol{
    func fetchResult() {
        DispatchQueue.main.async {
            self.mediaResults = self.databaseManager.retrieveAsArray()
            self.cView.reloadData()
        }
    }
}

