//
//  Galaxy.swift
//  PM_Project1
//
//  Created by Admin on 1/16/21.
//

import Foundation

enum GalaxyType: CaseIterable {
    case elliptical
    case spiral
    case irregular
}

class Galaxy {
    
    var name: String
    var age: UInt = 0
    var type: GalaxyType = GalaxyType.allCases.randomElement()!
    var starPlanetSystems: [StarPlanetSystem] = []
    var blackholes: [Star] = []
    var starMassLimit: UInt
    var starRadiusLimit: UInt
    weak var universe: Universe?
    
    init(name: String, starMassLimit: UInt, starRadiusLimit: UInt) {
        self.name = name
        self.starMassLimit = universe?.starMassLimit ?? 101
        self.starRadiusLimit = universe?.starRadiusLimit ?? 101
    }
    
}

extension Galaxy: WeightProtocol {
    var mass: UInt {
        starPlanetSystems.reduce(0) { $0 + $1.mass }
    }
}

extension Galaxy: TimerHandler {
    func timerTick() {
        age += 1
        
        if age.isMultiple(of: 10) {
            let starPlanetSystem = StarPlanetSystem(name: "Star-planet system \(age/10)",
                                                    starMassLimit: starMassLimit,
                                                    starRadiusLimit: starRadiusLimit)
            
            starPlanetSystems.append(starPlanetSystem)
        }
        
        starPlanetSystems.forEach {
            $0.timerTick()
        }
    }
}

extension Galaxy: GalaxyDelegate {
    func starBecomeBlackholeFinally(starPlanetSystem: StarPlanetSystem) {
        guard let index = starPlanetSystems.firstIndex(of: starPlanetSystem) else { return }
        starPlanetSystems.remove(at: index)
    }
}

extension Galaxy: Equatable {
    static func == (lhs: Galaxy, rhs: Galaxy) -> Bool {
        return lhs.name == rhs.name
    }
}
