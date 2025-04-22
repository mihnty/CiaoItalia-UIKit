//
//  Food.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 04/04/25.
//

enum Food:ContentType {
    case carbonara
    case pizza
    case cheese
    var dialogue:Dialogue {
        let option = Restaurant()
        return option as any Dialogue
    }
    var header:String {
        return "restaurantLand"
    }
    var title:String {
        return "almoço pela rua"
    }
    var imageName:String {
        switch self {
        case .carbonara:
            return "carbonara"
        case .pizza:
            return "pizza"
        case .cheese:
            return "cheese"
        }
    }
    var acessibilityHints:String {
        switch self {
        case .carbonara:
            return "prato de macarrão a carbonara"
        case .pizza:
            return "prato de pizza marguerita"
        case .cheese:
            return "pedaço de queijo"
        }
    }
    var headerAcessibilityHint:String {
        return "mesa com pratos de comida"
    }
    var portuguese:String {
        switch self {
        case .carbonara:
            return "Pasta à Carbonara"
        case .pizza:
            return "Pizza Marguerita"
        case .cheese:
            return "Queijo"
        }
    }
    var italian:String {
        switch self {
        case .carbonara:
            return "Pasta alla Carbonara"
        case .pizza:
            return "Pizza Margherita"
        case .cheese:
            return "Formaggio"
    
        }
    }
}


