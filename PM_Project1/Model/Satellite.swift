//
//  Satellite.swift
//  PM_Project1
//
//  Created by Admin on 1/16/21.
//

import Foundation

class Satellite: WeightProtocol {
    
    var name: String
    var age: UInt = 0
    var mass: UInt = UInt.random(in: 1...100)
    
    init(name: String) {
        self.name = name
    }
    
}
