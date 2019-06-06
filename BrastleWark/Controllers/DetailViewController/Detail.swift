//
//  Detail.swift
//  BrastleWark
//
//  Created by Alberto Josue Gonzalez on 6/6/19.
//  Copyright © 2019 Luis Arturo Gutiérrez. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage


class DetailViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var hairColorLbl: UILabel!
    @IBOutlet weak var whLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var professionsCollectionView: UICollectionView!
    @IBOutlet weak var friendsTableView: UITableView!
    
    
    var gnome = Gnome()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        title = gnome.name
        
        nameLbl.text = gnome.name
        idLbl.text = "ID: \(gnome.id ?? 10) Age: \(gnome.age ?? 100)"
        whLbl.text = "Weigth: \(gnome.weight ?? 10) Height: \(gnome.height ?? 10)"
        hairColorLbl.text = gnome.hair_color
        professionsCollectionView.dataSource = self
        professionsCollectionView.delegate = self
        
        friendsTableView.dataSource = self
        friendsTableView.delegate = self
        friendsTableView.tableFooterView = UIView()

        profileImage.layer.cornerRadius = profileImage.frame.width / 2

        guard let url = gnome.thumbnail else {
            return
        }
        
        profileImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "profileImage"))
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gnome.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friends", for: indexPath) as! FriendsTableViewCell
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.width / 2
        cell.nameLbl.text = gnome.friends[indexPath.row]
        
        guard let url = gnome.thumbnail else {
            return cell
        }
        
        cell.profileImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "profileImage"))
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
    
    
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gnome.professions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "professions", for: indexPath) as! ProfessionsCollectionViewCell
        cell.ProfessionLbl.text = gnome.professions[indexPath.row]
        
        return cell
    }
    
    
}
