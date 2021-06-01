//
//  Character.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 21/5/21.
//

import Foundation

struct Character : Codable {
    var name : String
    var species: String
    var gender: String
    var house: String
    var dateOfBirth: String
    var yearOfBirth: Int
    var ancestry: String
    var eyeColour: String
    var hairColour: String
    var wand: Wand
    var patronus: String
    var hogwartsStudent: Bool
    var hogwartsStaff: Bool
    var actor: String
    var alive: Bool
}
