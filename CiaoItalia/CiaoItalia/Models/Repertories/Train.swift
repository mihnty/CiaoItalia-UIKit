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
    static let header = "trainLand"
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


