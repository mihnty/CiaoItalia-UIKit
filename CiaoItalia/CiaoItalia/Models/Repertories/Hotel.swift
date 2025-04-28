//
//  Hotel.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 04/04/25.
//


enum Hotel:ContentType {
    case reservation
    case key
    
    var header:String {
        return "hotelLand"
    }
    var title:String {
        return "no hotel"
    }
    var acessibilityHints:String {
        switch self {
        case .reservation:
            return "bilhete comprovante de reserva"
        case .key:
            return "chaveiro com uma chave"
        }
    }
    var headerAcessibilityHint:String {
        return "fachada de hotel"
    }
    
    var imageName:String {
        switch self {
        case .reservation:
            return "reservation"
        case .key:
            return "key"
        }
    }
    
    var portuguese:String {
        switch self {
        case .reservation:
            return "Reserva"
        case .key:
            return "Chave"
        }
    }
    var italian:String {
        switch self {
        case .reservation:
            return "Prenotazione"
        case .key:
            return "Chiave"
    
        }
    }
    
    var dialogue: [DialogueItem] {
        return [
            .title("Chegada ao Hotel:"),
            .dialogue(DialogueLine(italian: "Buongiorno! Benvenuto al nostro hotel.", translation: "Bom dia! Bem-vindo ao nosso hotel.", type: .answer)),
            .dialogue(DialogueLine(italian: "Buongiorno! Ho una prenotazione.", translation: "Bom dia! Eu tenho uma reserva", type: .question)),
            .dialogue(DialogueLine(italian: "A che nome?", translation: "Em nome de quem?", type: .answer)),
            .dialogue(DialogueLine(italian: "A nome di [S/N]", translation: "Em nome de [Seu Nome].", type: .question)),
            .dialogue(DialogueLine(italian: "Ecco la sua chiave. La sua stanza è al secondo piano.", translation: "Aqui está sua chave. Seu quarto é no segundo andar.", type: .answer)),
            .dialogue(DialogueLine(italian: "A che ora è la colazione?", translation: "A que horas é o café da manhã?", type: .question)),
            .dialogue(DialogueLine(italian: "Dalle sette alle dieci.", translation: "Das sete às dez.", type: .answer)),
            .dialogue(DialogueLine(italian: "Perfetto, grazie.", translation: "Perfeito, obrigado.", type: .question)),
            .dialogue(DialogueLine(italian: "Prego! Buon soggiorno!", translation: "De nada! Tenha uma boa estadia!", type: .answer)),
            .end("Fim de diálogo")
        ]
    }
}


