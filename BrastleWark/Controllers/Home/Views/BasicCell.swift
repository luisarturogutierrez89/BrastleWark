//
//  BasicCell.swift
//  BrastleWark
//
//  Created by Alberto Josue Gonzalez on 6/6/19.
//  Copyright © 2019 Luis Arturo Gutiérrez. All rights reserved.
//

import Foundation
import UIKit

class BasicCell: UITableViewCell {
    
    @IBOutlet weak var wrapView: UIView!
    @IBOutlet weak var profilaImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var professionsCountLbl: UILabel!
    @IBOutlet weak var friendsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        wrapView.layer.cornerRadius = 10
        profilaImage?.layer.cornerRadius = profilaImage.frame.width / 2
    }
}

class FriendsTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class ProfessionsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ProfessionLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
