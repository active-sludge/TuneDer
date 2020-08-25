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
    var mediaResults = [Media]()
    
    @IBOutlet weak var cView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ResultManager.shared.delegate = self
        ResultManager.shared.fetchThenStoreData(fromURL: urlString)
        
        cView.delegate = self
        cView.dataSource = self
        self.cView.register(UINib(nibName: "MediaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainMediaCell")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? UICollectionViewCell,
            let indexPath = self.cView.indexPath(for: cell) {
         
            if segue.identifier == MainViewController.segueIdentifier {
                let destinationVC = segue.destination as! DetailViewController
                
                destinationVC.albumCover.af.setImage(withURL: URL(string: self.mediaResults[indexPath.row].artworkUrl100)!)
                destinationVC.artistName.text = mediaResults[indexPath.row].artistName
                destinationVC.trackName.text = mediaResults[indexPath.row].trackName
            }
        }
    }
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped")
        performSegue(withIdentifier: MainViewController.segueIdentifier, sender: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("highlight")
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
        
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let minColumnWidth: CGFloat = UIScreen.main.bounds.width - 20
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
    func fetchResult(result: [Media]) {
        self.mediaResults = result
        
        DispatchQueue.main.sync {
            self.cView.reloadData()
        }
    }
}


