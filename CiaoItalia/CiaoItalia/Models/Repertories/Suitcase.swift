//
//  Repertories.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 04/04/25.
//

enum Suitcase:CaseIterable {
    case ticket
    case passport
    case map
    
    var imageName:String {
        switch self {
        case .ticket:
            return "ticket"
        case .passport:
            return "passport"
        case .map:
            return "map"
        }
    }
    
    var portuguese:String {
        switch self {
        case .ticket:
            return "Bilhete"
        case .passport:
            return "Passaporte"
        case .map:
            return "Mapa"
        }
    }
    var italian:String {
        switch self {
        case .ticket:
            return "Biglietto"
        case .passport:
            return "Passaporto"
        case .map:
            return "Carta"
        }
    }
}


