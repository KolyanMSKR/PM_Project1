//
//  StarPlanetSystem.swift
//  PM_Project1
//
//  Created by Admin on 1/16/21.
//

import Foundation

class StarPlanetSystem {
    
    var name: String
    var age: UInt = 0
    var star: Star
    var planets: [Planet] = []
    var massLimit: UInt?
    var radiusLimit: UInt?
    
    weak var galaxy: Galaxy?
    
    init(name: String, starMassLimit: UInt, starRadiusLimit: UInt) {
        self.name = name
        self.star = Star(name: name, starMassLimit: starMassLimit, starRadiusLimit: starRadiusLimit)
        self.star.starPlanetSystem = self
    }
    
}

extension StarPlanetSystem: WeightProtocol {
    var mass: UInt {
        planets.reduce(star.mass) { $0 + $1.mass }
    }
}

extension StarPlanetSystem: TimerHandler {
    func timerTick() {
        age += 1
        
        if age.isMultiple(of: 10) && planets.count < 9 {
            let planet = Planet(name: "Planet \(planets.count)")
            planets.append(planet)
        }
        
        star.timerTick()
    }
}
