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
    
    var dialogue: [DialogueItem] {
        
        return [
            .title("Pedindo informação:"),
            .dialogue(DialogueLine(italian: "Ciao! Sei pronto per il viaggio?", translation: "Olá! Você está pronto para a viagem?", type: .answer)),
            .dialogue(DialogueLine(italian: "Quasi pronto. Puoi aiutarmi a fare un checklist?", translation: "Quase pronto. Você pode me ajudar a fazer um checklist?", type: .question)),
            .dialogue(DialogueLine(italian: "Certo! Prima di tutto, hai il passaporto?", translation: "Claro! Primeiro de tudo, você tem o passaporte?", type: .answer)),
            .dialogue(DialogueLine(italian: "Sì, ce l'ho qui.", translation: "Sim, eu tenho aqui.", type: .question)),
            .dialogue(DialogueLine(italian: "Perfetto! E il biglietto di viaggio?", translation: "Perfeito! E o bilhete de viagem?", type: .answer)),
            .dialogue(DialogueLine(italian: "Sì, eccolo.", translation: "Sim, aqui está.", type: .question)),
            .dialogue(DialogueLine(italian: "Ottimo! Hai una carta?", translation: "Ótimo! Você tem um mapa?", type: .answer)),
            .dialogue(DialogueLine(italian: "Sì, ho una carta.", translation: "Sim, eu tenho um mapa.", type: .question)),
            .dialogue(DialogueLine(italian: "Benissimo! Sei pronto per partire. Buon viaggio!", translation: "Perfeito! Você está pronto para partir. Boa viagem!", type: .answer)),
            .dialogue(DialogueLine(italian: "Grazie! Buon viaggio!", translation: "Obrigado! Boa viagem!", type: .question)),
            
                .end("Fim de diálogo")
        ]
    }
}


