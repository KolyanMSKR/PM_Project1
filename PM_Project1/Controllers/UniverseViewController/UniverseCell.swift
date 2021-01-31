//
//  UniverseCell.swift
//  PM_Project1
//
//  Created by Admin on 1/31/21.
//

import UIKit

class UniverseCell: UICollectionViewCell {
    
    static var cellID = "UniverseCell"
    
    let galaxyNameLabel = UILabel()
    let galaxyMassLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .yellow
        galaxyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        galaxyMassLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(galaxyNameLabel)
        contentView.addSubview(galaxyMassLabel)
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            galaxyNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            galaxyNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            galaxyMassLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            galaxyMassLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
}
