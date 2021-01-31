//
//  UniverseModel.swift
//  PM_Project1
//
//  Created by Admin on 1/24/21.
//

import Foundation

class UniverseViewModel {
    
    private var universe: Universe
    private var galaxies: [Galaxy] {
        universe.galaxies
    }
    
    var galaxiesCount: Int {
        galaxies.count
    }
    
    var dataReload: (() -> ())? {
        get {
            return universe.dataReload
        }
        
        set {
            universe.dataReload = newValue
        }
    }
    
    init(starMassLimit: UInt = 101, starRadiusLimit: UInt = 101) {
        self.universe = Universe(timer: UniverseTimer(timeInterval: 1.0),
                                 name: "The only one",
                                 starMassLimit: starMassLimit,
                                 starRadiusLimit: starRadiusLimit)
    }
    
    func galaxyName(for indexPath: IndexPath) -> String {
        return galaxies[indexPath.row].name
    }
    
}

class GalaxyViewModel {
    
    var galaxy: Galaxy
    
    var elementsCount: Int {
        galaxy.starPlanetSystems.count + galaxy.blackholes.count
    }
    
    init(galaxy: Galaxy) {
        self.galaxy = galaxy
    }
    
    
    
}
