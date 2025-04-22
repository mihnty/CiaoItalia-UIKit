//
//  Train.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 04/04/25.
//

enum Train:ContentType {
    case train
    case ticketShop
    case platform
    var dialogue:Dialogue {
        let option = TrainStation()
        return option as any Dialogue
    }
    var header:String {
        return "trainLand"
    }
    var title:String {
        return "pegando o trem"
    }
    var acessibilityHints:String {
        switch self {
        case .train:
            return "visão frontal de um trem"
        case .ticketShop:
            return "fachada de uma bilheteria de uma estação de trem"
        case .platform:
            return "placa indicando plataforma 04"
        }
    }
    var headerAcessibilityHint:String {
        return "plataforma de acesso ao trem"
    }
    var imageName:String {
        switch self {
        case .train:
            return "treno"
        case .ticketShop:
            return "biglietteria"
        case .platform:
            return "binario"
        }
    }
    
    var portuguese:String {
        switch self {
        case .train:
            return "Trem"
        case .ticketShop:
            return "Bilheteria"
        case .platform:
            return "Plataforma"
        }
    }
    var italian:String {
        switch self {
        case .train:
            return "Treno"
        case .ticketShop:
            return "Biglietteria"
        case .platform:
            return "Binario"
    
        }
    }
}


