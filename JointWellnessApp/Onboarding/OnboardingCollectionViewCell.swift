//
//  OnboardingCollectionViewCell.swift
//  JointWellnessApp
//
//  Created by shafique dassu on 21/08/2023.
//

import UIKit
import Lottie


class OnboardingCollectionViewCell: UICollectionViewCell {
    
//    var identifier: String
    @IBOutlet weak var animationContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = "OnboardingCollectionViewCell"
    
    var animation = LottieAnimationView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(page: Page) {
        animation = LottieAnimationView(name: page.animationName)
        animation.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height * 0.8)
        
        animation.animationSpeed = 1
        animation.loopMode = .loop
        animation.play()
        
        animationContainer.addSubview(animation)
        
        self.titleLabel.text = page.title
        self.descriptionLabel.text = page.description
    }
}
