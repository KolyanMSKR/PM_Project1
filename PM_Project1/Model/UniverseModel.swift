//
//  UniverseModel.swift
//  PM_Project1
//
//  Created by Admin on 1/24/21.
//

import Foundation

class UniverseModel {
    
    var universe: Universe
    
    init(universeName: String, starMassLimit: UInt = 101, starRadiusLimit: UInt = 101) {
        self.universe = Universe(name: universeName, starMassLimit: starMassLimit, starRadiusLimit: starRadiusLimit)
    }
    
}
