//
//  GalaxyViewModel.swift
//  PM_Project1
//
//  Created by Admin on 1/31/21.
//

import Foundation

class GalaxyViewModel {
    
    var galaxy: Galaxy
    
    var starsCount: Int {
        galaxy.starPlanetSystems.count
    }
    
    var dataReload: (() -> ())? {
        get {
            return galaxy.dataReload
        }
        
        set {
            galaxy.dataReload = newValue
        }
    }
    
    init(galaxy: Galaxy) {
        self.galaxy = galaxy
    }
    
    func starName(for indexPath: IndexPath) -> String {
        return galaxy.starPlanetSystems[indexPath.row].name
    }
    
    func starPlanetSystemMass(for indexPath: IndexPath) -> UInt {
        return galaxy.starPlanetSystems[indexPath.row].mass
    }
    
}
