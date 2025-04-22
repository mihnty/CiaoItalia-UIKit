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
    
    var dialogue: [DialogueItem] {
        return [
            .title("Almoço na rua:"),
            .dialogue(DialogueLine(italian: "Buongiorno! È la mia prima volta in Italia.", translation: "Bom dia! É minha primeira vez na Itália.", type: .question)),
            .dialogue(DialogueLine(italian: "Benvenuta! Hai già deciso cosa ordinare?", translation: "Bem-vinda! Já decidiu o que vai pedir?", type: .answer)),
            .dialogue(DialogueLine(italian: "Sì, vorrei una pizza margherita, per favore. Adoro il formaggio italiano!", translation: "Sim, gostaria de uma pizza margherita, por favor. Eu adoro o queijo italiano!", type: .question)),
            .dialogue(DialogueLine(italian: "Ottima scelta! Vuoi provare anche la nostra pasta alla carbonara?", translation: "Ótima escolha! Quer experimentar também nossa pasta alla carbonara?", type: .answer)),
            .dialogue(DialogueLine(italian: "Hmm, perché no? La prendo anche!", translation: "Hmm, por que não? Vou querer também!", type: .question)),
            .dialogue(DialogueLine(italian: "Perfetto, arrivo subito!", translation: "Perfeito, já volto.", type: .answer)),
            .dialogue(DialogueLine(italian: "Grazie.", translation: "Obrigada!", type: .question)),
            .end("Fim de diálogo")
        ]
    }
}


