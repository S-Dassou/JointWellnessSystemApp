//
//  CategoryDetailTableViewCell.swift
//  JointWellnessApp
//
//  Created by shafique dassu on 04/09/2023.
//

import UIKit

class CategoryDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryDetailContainerView: UIView!
    @IBOutlet weak var routineNameLabel: UILabel!
    @IBOutlet weak var routineImageView: UIImageView!
    @IBOutlet weak var routineTimeLabel: UILabel!
    @IBOutlet weak var routineDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
