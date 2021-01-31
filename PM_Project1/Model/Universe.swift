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
    var galaxies: [Galaxy] = [] {
        didSet {
            dataReload?()
        }
    }
    var starMassLimit: UInt
    var starRadiusLimit: UInt
    
    var dataReload: (() -> ())?
    
    private var timeInterval: TimeInterval = 1.0
    private var timer: UniverseTimer!
    
    init(timer: UniverseTimer, name: String, starMassLimit: UInt, starRadiusLimit: UInt) {
        self.name = name
        self.starMassLimit = starMassLimit
        self.starRadiusLimit = starRadiusLimit
        self.timer = timer
        timer.eventHandler = { [self] in
            timerTick()
            print(Date())
        }
        timer.resume()
        print("universe was created. \(name)")
    }
    
}


extension Universe {
    func merge() {
        var oldGalaxies = galaxies.filter({ $0.age > 14 })
        print("MERGE BEGIN")
        if oldGalaxies.count > 1 {
            oldGalaxies.shuffle()
            let first = oldGalaxies[0]
            let second = oldGalaxies[1]
            print("COUNT \(galaxies.count)")
            guard let index = galaxies.firstIndex(of: second) else { return }
            galaxies.remove(at: index)
            print("COUNT \(galaxies.count)")
            first.starPlanetSystems.append(contentsOf: second.starPlanetSystems)
            first.starPlanetSystems.removeSubrange(0..<first.starPlanetSystems.count)
            print("MERGE END")
        }
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
        
        if age.isMultiple(of: 12) {
            merge()
        }
        
        galaxies.forEach {
            $0.timerTick()
        }
    }
}
