//
//  Star.swift
//  PM_Project1
//
//  Created by Admin on 1/16/21.
//

import Foundation

enum StarType: CaseIterable {
    case O
    case B
    case A
    case F
    case G
    case K
    case M
}

enum StarStage: CaseIterable {
    case young
    case old
    case dwarf
    case blackhole
}

class Star {
    var name: String
    var age: UInt = 0
    var type: StarType = StarType.allCases.randomElement()!
    var stage: StarStage = .young
    var mass: UInt = UInt.random(in: 1...100)
    var temperature: Int = Int.random(in: 1...100)
    var radius: UInt = UInt.random(in: 1...100)
    var luminosity: UInt = UInt.random(in: 1...100)
    var starMassLimit: UInt
    var starRadiusLimit: UInt
    
    weak var starPlanetSystem: StarPlanetSystem?
    weak var delegate: BlackholeDelegate?
    
    init(name: String, starMassLimit: UInt, starRadiusLimit: UInt) {
        self.name = name
        self.starMassLimit = starMassLimit
        self.starRadiusLimit = starRadiusLimit
    }
    
}

extension Star: TimerHandler {
    func timerTick() {
        guard stage == .blackhole else { return }
        
        age += 1
        
        if age.isMultiple(of: 60) {
            switch stage {
            case .young:
                stage = .old
            case .old:
                if mass < starMassLimit && radius < starRadiusLimit {
                    stage = .dwarf
                    return
                } else {
                    stage = .blackhole
                    delegate?.starToBlackholeTransformation(star: self)
                }
            case .dwarf, .blackhole: return
            }
        }
    }
}
