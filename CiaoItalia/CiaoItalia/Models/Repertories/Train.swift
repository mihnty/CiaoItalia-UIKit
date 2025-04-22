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
    
    var dialogue: [DialogueItem] {
        
        return [
            .title("Comprando a passagem:"),
            .dialogue(DialogueLine(italian: "Buona notte! Scusi, mi può dire a che ora parte il treno per Roma?", translation: "Boa noite! Licença, pode-me dizer de que horas parte o trem para Roma?", type: .question)),
            .dialogue(DialogueLine(italian: "Buona notte! Il treno per Roma arriva alle dieci e mezza e parte a mezzanotte.", translation: "Boa noite! O trem para Roma chega às dez e meia e parte à meia-noite.", type: .answer)),
            .dialogue(DialogueLine(italian: "Grazie! E quanto costa il biglietto?", translation: "Obrigado! E quanto custa o bilhete?", type: .question)),
            .dialogue(DialogueLine(italian: "Prima o seconda classe?", translation: "Primeira ou segunda classe?", type: .answer)),
            .dialogue(DialogueLine(italian: "Seconda, per favore.", translation: "Segunda, por favor.", type: .question)),
            .dialogue(DialogueLine(italian: "Andata e ritorno?", translation: "Ida e volta?", type: .answer)),
            .dialogue(DialogueLine(italian: "Solo andata, per favore.", translation: "Só ida, por favor.", type: .question)),
            .dialogue(DialogueLine(italian: "Costa 30 euro.", translation: "Custa 30 euros", type: .answer)),
            .dialogue(DialogueLine(italian: "Perfetto, vorrei prenderlo. Da quale binario parte il treno?", translation: "Perfeito, eu gostaria de comprá-lo. De qual plataforma parte o trem?", type: .question)),
            .dialogue(DialogueLine(italian: "Sul binario 4. Buon viaggio!", translation: "Da plataforma 3. Boa viagem!", type: .answer)),
            .end("Fim de diálogo")
        ]
    }
}


