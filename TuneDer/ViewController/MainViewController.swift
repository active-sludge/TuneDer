//
//  MainViewController.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 14.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
 
    let urlString = "https://itunes.apple.com/search?term=jack+johnson"
    static let segueIdentifier = "goDetailViewController"
    var searchResult: SearchResult!
    
    @IBOutlet weak var collectionView: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ResultManager.shared.delegate = self
        ResultManager.shared.fetchThenStoreData(fromURL: urlString)
        
        self.collectionView.register(MediaCollectionViewCell.nib(), forCellWithReuseIdentifier: MediaCollectionViewCell.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped")
    }
    
}


//MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource{
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.identifier, for: indexPath) as! MediaCollectionViewCell
        
        if searchResult != nil {
            DispatchQueue.main.async {
                cell.artistName.text = self.searchResult.mediaResults[indexPath.row].artistName
                cell.trackName.text = self.searchResult.mediaResults[indexPath.row].trackName
            }
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1.1, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8,left: 6,bottom: 8,right: 6)
    }
    

}

//MARK: - MainViewController: ResultManagerProtocol

extension MainViewController: ResultManagerProtocol{
    func fetchResult(result: SearchResult) {
        DispatchQueue.main.async {
            self.searchResult = result
            self.collectionView.reloadData()
        }
    }
}

