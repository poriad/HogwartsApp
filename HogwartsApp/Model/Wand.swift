//
//  Wand.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 21/5/21.
//

import Foundation

struct Wand : Decodable {
    var wood : String
    var core : String
    var length: QuantumValue
}
