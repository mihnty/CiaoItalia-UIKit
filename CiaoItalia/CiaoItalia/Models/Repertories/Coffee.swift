//
//  Coffee.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 04/04/25.
//

enum Coffee:ContentType {
    case coffee
    case coffeeShop

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
    var acessibilityHints:String {
        switch self {
        case .coffee:
            return "copo de café"
        case .coffeeShop:
            return "cafeteira"
        }
    }
    var headerAcessibilityHint:String {
        return "cafeteria"
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
    
    var dialogue: [DialogueItem] {
        return [
            .title("Pedindo informação:"),
            .dialogue(DialogueLine(italian: "Buongiorno!", translation: "Bom dia!", type: .question)),
            .dialogue(DialogueLine(italian: "Buongiorno! Come posso aiutarla?", translation: "Bom dia! Como posso ajudá-lo?", type: .answer)),
            .dialogue(DialogueLine(italian: "Vorrei un caffè, per favore.", translation: "Eu gostaria de um café, por favor.", type: .question)),
            .dialogue(DialogueLine(italian: "Certo, un caffè. Vuole qualcos'altro?", translation: "Certo, um café. Deseja mais alguma coisa?", type: .answer)),
            .dialogue(DialogueLine(italian: "No grazie, il conto per favore", translation: "Não obrigado, a conta por favor.", type: .question)),
            .dialogue(DialogueLine(italian: "Sono due euro e cinquanta.", translation: "São dois euros e cinquenta.", type: .answer)),
            .dialogue(DialogueLine(italian: "Ecco a lei. Il caffè è delizioso, grazie!", translation: "Aqui está. O café está delicioso, obrigado!", type: .question)),
            .end("Fim de diálogo")
        ]
    }
}


