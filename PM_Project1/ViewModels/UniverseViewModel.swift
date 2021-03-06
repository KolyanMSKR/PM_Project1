//
//  UniverseViewModel.swift
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
    
    func galaxyMass(for indexPath: IndexPath) -> UInt {
        return galaxies[indexPath.row].mass
    }
    
    func galaxyViewModel(for indexPath: IndexPath) -> GalaxyViewModel {
        return GalaxyViewModel(galaxy: galaxies[indexPath.row])
    }
    
}
