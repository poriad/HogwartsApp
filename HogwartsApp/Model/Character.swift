//
//  Character.swift
//  HogwartsApp
//
//  Created by Pablo Oria de Rueda Pérez on 21/5/21.
//

import Foundation

struct Character : Decodable {
    var name : String
    var species: String
    var gender: String
    var house: String
    var dateOfBirth: String
    var yearOfBirth: QuantumValue
    var ancestry: String
    var eyeColour: String
    var hairColour: String
    var wand: Wand
    var patronus: String
    var hogwartsStudent: Bool
    var hogwartsStaff: Bool
    var actor: String
    var alive: Bool
    var image: String 
    
    
}

enum QuantumValue: Decodable {

    case float(Float), string(String)

    init(from decoder: Decoder) throws {
        if let float = try? decoder.singleValueContainer().decode(Float.self) {
            self = .float(float)
            return
        }

        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }

        throw QuantumError.missingValue
    }

    enum QuantumError:Error {
        case missingValue
    }
}
