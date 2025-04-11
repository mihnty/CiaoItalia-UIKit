//
//  Touristing.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 11/04/25.
//

enum Touristing:ContentType {
    case museum
    case square
    case road
    case left
    case right
    var header:String {
        return "cityLand"
    }
    var title:String {
        return "turistando"
    }
    var imageName:String {
        switch self {
        case .museum:
            return "museo"
        case .square:
            return "piazza"
        case .road:
            return "strada"
        case .right:
            return "destra"
        case .left:
            return "sinistra"
        }
    }
    
    var portuguese:String {
        switch self {
        case .museum:
            return "Museu"
        case .square:
            return "Praça"
        case .road:
            return "Rua"
        case .right:
            return "Direita"
        case .left:
            return "Esquerda"
        }
    }
    var italian:String {
        switch self {
        case .museum:
            return "Museo"
        case .square:
            return "Piazza"
        case .road:
            return "Strada"
        case .right:
            return "Destra"
        case .left:
            return "Sinistra"
        }
    }
}


