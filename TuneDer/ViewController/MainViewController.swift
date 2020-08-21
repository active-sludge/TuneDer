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
    var searchResult = [Media]()
    
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
        if segue.identifier == MainViewController.segueIdentifier {
            
        }
    }
    
    
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped")
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("highlight")
    }
}


//MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.searchResult.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.identifier, for: indexPath) as! MediaCollectionViewCell
        
        
        cell.artistName.text = self.searchResult[indexPath.row].artistName
        cell.trackName.text = self.searchResult[indexPath.row].trackName
        
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
    func fetchResult(result: SearchResult) {
        self.searchResult = result.mediaResults
        DispatchQueue.main.sync {
            self.cView.reloadData()
        }
    }
}


