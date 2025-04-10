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
    static let header = "restaurantLand"
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


