//
//  Coffee.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 04/04/25.
//

enum Coffee:ContentType {
    case coffee
    case coffeeShop
    var dialogue:Dialogue {
        let option = CoffeeShop()
        return option as any Dialogue
    }
    var header:String {
        return "caffetteriaLand"
    }
    var title:String {
        return "ida ao café"
    }
    var imageName:String {
        switch self {
        case .coffee:
            return "coffee"
        case .coffeeShop:
            return "coffeeShop"
        }
    }
    
    var portuguese:String {
        switch self {
        case .coffee:
            return "Café"
        case .coffeeShop:
            return "Cafeteria"
        }
    }
    var italian:String {
        switch self {
        case .coffee:
            return "Caffè"
        case .coffeeShop:
            return "Caffetteria"
    
        }
    }
}


