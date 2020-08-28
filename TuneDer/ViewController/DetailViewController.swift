//
//  DetailViewController.swift
//  TuneDer
//
//  Created by Huseyin Can Dayan on 20.08.2020.
//  Copyright © 2020 Huseyin Can Dayan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data = DetailModel()
    var tableView = UITableView()
    var safeArea: UILayoutGuide!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        setupTableView()
    }
    
    func setupTableView() {
        
        print("setupTableView is loaded.")
        print(data)
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor).isActive = true
        tableView.rowHeight = safeArea.layoutFrame.size.height
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: DetailViewCell.identifier)
    }
}

extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewCell.identifier, for: indexPath)
        
        cell.textLabel?.text = data.artistName
        cell.imageView?.af.setImage(withURL: URL(string: data.thumbnailURLString)!)
        
        return cell
    }
    
    
}
