//
//  PrimarySecondaryTextCollectionViewCell.swift
//  Unit6_Project
//
//  Created by Kazunobu Someya on 2021-02-14.
//

import UIKit

class PrimarySecondaryTextCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var primaryTextLabel: UILabel!
    @IBOutlet var secondaryTextLabel: UILabel!
}

class SelectionIndicatingPrimarySecondaryTextCollectionViewCell:
   PrimarySecondaryTextCollectionViewCell {
    override func awakeFromNib() {
        let background = UIView(frame: bounds)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = UIColor.systemGray4.withAlphaComponent(0.75)
        selectedBackgroundView = background
        
        layer.cornerRadius = 8
        layer.shadowRadius = 3
        layer.shadowColor = UIColor.systemGray3.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1
        layer.masksToBounds = false
        background.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo:
               background.leadingAnchor),
            trailingAnchor.constraint(equalTo:
               background.trailingAnchor),
            topAnchor.constraint(equalTo: background.topAnchor),
            bottomAnchor.constraint(equalTo: background.bottomAnchor)
        ])
    }
}
