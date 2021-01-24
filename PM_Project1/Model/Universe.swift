//
//  Universe.swift
//  PM_Project1
//
//  Created by Admin on 1/16/21.
//

import Foundation

class Universe {
    
    var name: String
    var age: UInt = 0
    var galaxies: [Galaxy] = []
    var starMassLimit: UInt
    var starRadiusLimit: UInt
    
    init(name: String, starMassLimit: UInt, starRadiusLimit: UInt) {
        self.name = name
        self.starMassLimit = starMassLimit
        self.starRadiusLimit = starRadiusLimit
    }
    
}

extension Universe: WeightProtocol {
    var mass: UInt {
        galaxies.reduce(0) { $0 + $1.mass }
    }
}

extension Universe: TimerHandler {
    func timerTick() {
        age += 1
        
        if age.isMultiple(of: 10) {
            let galaxy = Galaxy(name: "Galaxy \(age/10)", starMassLimit: starMassLimit, starRadiusLimit: starRadiusLimit)
            galaxies.append(galaxy)
        }
        
        if age.isMultiple(of: 30) {
            #warning("implement merging of galaxies")
        }
        
        galaxies.forEach {
            $0.timerTick()
        }
    }
}
