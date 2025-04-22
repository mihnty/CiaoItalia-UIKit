//
//  Repertories.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 04/04/25.
//

enum Suitcase:ContentType {
    case ticket
    case passport
    case map
    var dialogue:Dialogue {
        let option = Travel()
        return option as any Dialogue
    }
    var header:String {
        return "suitcaseLand"
    }
    var title:String {
        return "arrumando a mala"
    }
    var acessibilityHints:String {
        switch self {
        case .ticket:
            return "bilhete de trem"
        case .passport:
            return "passaporte vermelho fechado"
        case .map:
            return "mapa"
        }
    }
    var headerAcessibilityHint:String {
        return "mala aberta com roupas dentro"
    }
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


