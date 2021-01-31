//
//  GalaxyCell.swift
//  PM_Project1
//
//  Created by Admin on 1/31/21.
//

import UIKit

class GalaxyCell: UICollectionViewCell {
    
    static var cellID = "GalaxyCell"
    
    let starPlanetSystemNameLabel = UILabel()
    let starPlanetSystemMassLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .yellow
        starPlanetSystemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        starPlanetSystemMassLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(starPlanetSystemNameLabel)
        contentView.addSubview(starPlanetSystemMassLabel)
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            starPlanetSystemNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            starPlanetSystemNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            starPlanetSystemMassLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            starPlanetSystemMassLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
}
