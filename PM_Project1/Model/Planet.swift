//
//  Planet.swift
//  PM_Project1
//
//  Created by Admin on 1/16/21.
//

import Foundation

enum PlanetType: CaseIterable {
    case byMassRegime
    case byOrbitalRegime
    case byComposition
    case other
}

class Planet {
    
    var name: String
    var age: UInt = 0
    var type: PlanetType = PlanetType.allCases.randomElement()!
    var planetMass: UInt = UInt.random(in: 1...100)
    var temperature: Int = Int.random(in: 1...100)
    var radius: UInt = UInt.random(in: 1...100)
    var satellites: [Satellite] = []
    weak var hostStar: Star?
    
    init(name: String) {
        self.name = name
        
        let satellitesCount = Int.random(in: 0...5)
        for index in 0..<satellitesCount {
            let satellite = Satellite(name: "Satellite: \(index) of planet \(name)")
            self.satellites.append(satellite)
        }
    }
    
}

extension Planet: WeightProtocol {
    var mass: UInt {
        satellites.reduce(planetMass) { $0 + $1.mass }
    }
}
